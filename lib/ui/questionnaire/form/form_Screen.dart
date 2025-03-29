import 'package:digprev_flutter/domain/models/section/section.dart';
import 'package:digprev_flutter/domain/models/stage/stage.dart';
import 'package:digprev_flutter/ui/questionnaire/form/viewModels/formViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/form/viewModels/sectionViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/form/widgets/form.dart';
import 'package:digprev_flutter/ui/questionnaire/form/widgets/app_Bar_Form.dart';
import 'package:digprev_flutter/utils/helpers/sectionHelper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:result_command/result_command.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

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
  late Stage _stage;
  final PageController _pageController = PageController();
  final List<GlobalKey<FormState>> _formKeys = <GlobalKey<FormState>>[];
  final List<bool> _completedSteps = <bool>[];
  final List<ItemScrollController> itemsScrollController =
  <ItemScrollController>[];
  int _currentPage = 0;
  bool _isActive = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    widget.formViewModel.startObserving();
    widget.viewModel.loadCommand.addListener(_onCommandStateChanged);
    widget.viewModel.loadCommand.execute(int.parse(widget.stageId));
  }

  @override
  void dispose() {
    widget.formViewModel.stopObserving();
    widget.viewModel.loadCommand.removeListener(_onCommandStateChanged);
    widget.viewModel.loadCommand.execute;
    super.dispose();
  }

  void _onCommandStateChanged() {
    final CommandState<Stage> snapshot = widget.viewModel.loadCommand.value;
    if (snapshot is SuccessCommand<Stage>) {
      setState(() {
        _stage = snapshot.value;
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

  Future<void> canPop() async {
    await scrollToQuestion();
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

  initialPage() async {
    final (int section, int question) = await widget.formViewModel.findLastPage(
      _stage,
    );
    for (int i = 0; i < section; i++)
      _completedSteps[i] = true;
    _pageController.animateToPage(
      section,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
    setState(() {
      _currentPage = section;
      _isActive = false;
    });
  }

  Future<void> scrollToQuestion() async {
    final (int section, int question) = await widget.formViewModel.findLastPage(
      _stage,
    );
    if (question - 1 >= 1) {
      await itemsScrollController[_currentPage].scrollTo(
        index: question - 1,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );

    }


  }

  Future<void> jumpToPage(int page) async {
    setState(() {
      _isLoading = true;
    });
    await scrollToQuestion();

    if (_formKeys[_currentPage].currentState?.validate() ?? false) {
      _completedSteps[_currentPage] = true;
      _pageController.animateToPage(
        page,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPage = page;
        _isLoading=false;
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

    _initKeys();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initPage();
    });
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Column(
            children: [
              AppBarForm(
                sections: _sections,
                currentStep: _currentPage.toInt(),
                totalSteps: _sections.length,
                canMarkStepComplete: _isStepCompleted,
                onStepTapped: jumpToPage,
              ),

              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _sections.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FormQuestions(
                      itemScrollController: itemsScrollController[index],
                      formKey: _formKeys[index],
                      section: _sections[index],
                      onPrevious: onPrevious,
                      onNext: onNext,
                      viewModel: context.read(),
                    );
                  },
                ),
              ),
            ],
          ),
          if (_isLoading)
            Stack(
              children: [
                ModalBarrier(
                  dismissible: false,
                  color: Colors.black.withOpacity(
                    0.5,
                  ), // Cor de fundo do barrier
                ),
                const Center(child: CircularProgressIndicator()),
              ],
            ),
        ],
      ),
    );
  }

  Future<void> _initPage() async {

    if (_isActive) {
      setState(() {
        _isLoading = true;
      });
      Future<Null>.delayed(const Duration(milliseconds: 200), () async {
        if (mounted) {
          await initialPage();
          await Future<Null>.delayed(const Duration(seconds: 1));
          await scrollToQuestion();
          await Future<Null>.delayed(const Duration(milliseconds: 200));
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }

  void _initKeys() {
    _formKeys.addAll(
      List<GlobalKey<FormState>>.generate(
        _sections.length,
            (int index) => GlobalKey<FormState>(),
      ),
    );
    _completedSteps.addAll(List<bool>.filled(_sections.length, false));
    itemsScrollController.addAll(
      List<ItemScrollController>.generate(
        _sections.length,
            (_) => ItemScrollController(),
      ),
    );
  }
}
