import 'package:digprev_flutter/domain/models/section/section.dart';
import 'package:digprev_flutter/domain/models/stage/stage.dart';
import 'package:digprev_flutter/ui/questionnaire/form/viewModels/formViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/form/viewModels/sectionViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/form/widgets/questionFormWidget.dart';
import 'package:digprev_flutter/ui/questionnaire/form/widgets/stepperIndicatorWidget.dart';
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
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    widget.viewModel.loadComand.addListener(_onCommandStateChanged);
    widget.viewModel.loadComand.execute(int.parse(widget.stageId));
  }

  @override
  void dispose() {
    widget.viewModel.loadComand.removeListener(_onCommandStateChanged);
    widget.viewModel.loadComand.execute;
    super.dispose();
  }

  void _onCommandStateChanged() {
    final CommandState<Stage> snapshot = widget.viewModel.loadComand.value;
    if (snapshot is SuccessCommand<Stage>) {
      setState(() {
        _sections = SectionHelper.flattenSections(snapshot.value);
      });
    } else if (snapshot is FailureCommand<Stage>) {}
  }

  void onNext() {
    setState(() {
      if (_currentPage < _sections.length - 1) {
        _currentPage++;
        jumpToPage(_currentPage);
      } else
        GoRouter.of(context).pop();
    });
  }

  void onPrevious() {
    setState(() {
      if (_currentPage > 0) {
        _currentPage--;
        jumpToPage(_currentPage);
      } else
        GoRouter.of(context).pop();
    });
  }

  void jumpToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    setState(() {
      _currentPage = page;
    });
  }

  bool _isStepCompleted(int step) {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.viewModel.loadComand.isRunning) {
      return const Center(child: CircularProgressIndicator());
    } else if (widget.viewModel.loadComand.isFailure) {
      return const Center(
        child: Text('falha ao carregar os dados tente novamente mais tarde'),
      );
    }
    final bool hasStepper = (_sections.length > 1);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Card(
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: <Widget>[
                Column(
                  children: <Widget>[
                    if (hasStepper)
                      const SizedBox(height: 67,),
                    Expanded(
                      child: PageView.builder(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _sections.length,
                      itemBuilder: (BuildContext context, int index) {
                        return QuestionFormWidget(
                          section: _sections[index],
                          onPrevious: onPrevious,
                          onNext: onNext,
                          viewModel: widget.formViewModel,
                        );
                      },
                      ),
                    ),
                  ],
                ),
              if (hasStepper)
                Header(),
            ],
          ),
        );
      },
    );
  }

  Widget Header() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 72),
      child: Container(
        margin: EdgeInsets.zero,
        width: double.infinity,
        color: Theme.of(context).colorScheme.tertiary,
        child: FractionallySizedBox(
          widthFactor: _sections.length == 2 ? 0.7 : 1.0,
          child: StepperIndicatorWidget(
            currentStep: _currentPage.toInt(),
            totalSteps: _sections.length,
            canMarkStepComplete: _isStepCompleted,
            onStepTapped: jumpToPage,
          ),
        ),
      ),
    );
  }
}
