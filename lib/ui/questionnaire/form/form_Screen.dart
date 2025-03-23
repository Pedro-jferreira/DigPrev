import 'package:digprev_flutter/domain/models/section/section.dart';
import 'package:digprev_flutter/domain/models/stage/stage.dart';
import 'package:digprev_flutter/ui/questionnaire/form/viewModels/formViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/form/viewModels/sectionViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/form/widgets/form.dart';
import 'package:digprev_flutter/ui/questionnaire/form/widgets/app_Bar_Form.dart';
import 'package:digprev_flutter/utils/helpers/sectionHelper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:result_command/result_command.dart';

class FormScreen extends StatefulWidget {
  final String stageId;
  final SectionViewModel viewModel;
  final FormViewModel formViewModel;

  const FormScreen({
    required this.stageId,
    required this.viewModel,
    required this.formViewModel,
    super.key,
  });

  @override
  State<FormScreen> createState() => SectionPageState();
}

class SectionPageState extends State<FormScreen> {
  List<Section> _sections = <Section>[];
  final PageController _pageController = PageController();
  final List<GlobalKey<FormState>> _formKeys = <GlobalKey<FormState>>[];
  final List<bool> _completedSteps = <bool>[];
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    widget.viewModel.loadCommand.addListener(_onCommandStateChanged);
    widget.viewModel.loadCommand.execute(int.parse(widget.stageId));
  }

  @override
  void dispose() {
    widget.viewModel.loadCommand.removeListener(_onCommandStateChanged);
    widget.viewModel.loadCommand.execute;
    super.dispose();
  }

  void _onCommandStateChanged() {
    final CommandState<Stage> snapshot = widget.viewModel.loadCommand.value;
    if (snapshot is SuccessCommand<Stage>) {
      setState(() {
        _sections = SectionHelper.flattenSections(snapshot.value);
      });
    } else if (snapshot is FailureCommand<Stage>) {}
  }

  void onNext() {
    setState(() {
      if (_currentPage < _sections.length - 1) {
        final int page = _currentPage + 1;
        jumpToPage(page);
      } else
        canPop();
    });
  }

  void onPrevious() {
    setState(() {
      if (_currentPage > 0) {
        final int page = _currentPage - 1;
        jumpToPage(page);
      } else
        canPop();
    });
  }

  void canPop() {
    if (_formKeys[_currentPage].currentState?.validate() ?? false) {
      GoRouter.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, preencha corretamente antes de avançar.'),
        ),
      );
    }
  }

  void jumpToPage(int page) {
    if (_formKeys[_currentPage].currentState?.validate() ?? false) {
      _completedSteps[_currentPage] = true;
      _pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPage = page;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, preencha corretamente antes de avançar.'),
        ),
      );
    }
  }

  bool _isStepCompleted(int step) {
    if (step < 0 || step >= _completedSteps.length) return false;
    return _completedSteps[step];
  }

  @override
  Widget build(BuildContext context) {
    if (widget.viewModel.loadCommand.isRunning) {
      return const Center(child: CircularProgressIndicator());
    } else if (widget.viewModel.loadCommand.isFailure) {
      return const Center(
        child: Text('Falha ao carregar os dados. Tente novamente mais tarde'),
      );
    }

    _formKeys.addAll(
      List<GlobalKey<FormState>>.generate(
        _sections.length,
        (int index) => GlobalKey<FormState>(),
      ),
    );
    _completedSteps.addAll(List<bool>.filled(_sections.length, false));
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
        appBar: AppBarForm(
          sections: _sections,
          currentStep: _currentPage.toInt(),
          totalSteps: _sections.length,
          canMarkStepComplete: _isStepCompleted,
          onStepTapped: jumpToPage,
        ),

        body: PageView.builder(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _sections.length,
          itemBuilder: (BuildContext context, int index) {
            return FormQuestions(
              formKey: _formKeys[index],
              section: _sections[index],
              onPrevious: onPrevious,
              onNext: onNext,
              viewModel: widget.formViewModel,
            );
          },
        ),
      ),
    );
  }
}
