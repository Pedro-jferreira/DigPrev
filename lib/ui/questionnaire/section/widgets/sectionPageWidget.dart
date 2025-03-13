import 'package:digprev_flutter/domain/models/section/section.dart';
import 'package:digprev_flutter/domain/models/stage/stage.dart';
import 'package:digprev_flutter/ui/questionnaire/question/viewModels/formViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/section/viewModels/sectionViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/question/widgets/questionFormWidget.dart';
import 'package:digprev_flutter/ui/questionnaire/section/widgets/stepperIndicatorWidget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:result_command/result_command.dart';

class SectionPageWidget extends StatefulWidget {
  final String stageId;
  final SectionViewModel viewModel;
  final FormViewModel formViewModel;

  const SectionPageWidget({
    required this.stageId,
    required this.viewModel,
    required this.formViewModel,
    super.key,
  });

  @override
  State<SectionPageWidget> createState() => SectionPageState();
}

class SectionPageState extends State<SectionPageWidget> {
  List<Section> _sections = <Section>[];
  final PageController _scrollController = PageController();
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
        _sections = snapshot.value.sections!;
      });
    } else if (snapshot is FailureCommand<Stage>) {}
  }

  void onNext() {
    setState(() {
      if (_currentPage < _sections.length - 1) {
        _currentPage++;
        _scrollToPage(_currentPage);
      } else
        GoRouter.of(context).pop();
    });
  }

  void onPrevious() {
    setState(() {
      if (_currentPage > 0) {
        _currentPage--;
        _scrollToPage(_currentPage);
      } else
        GoRouter.of(context).pop();
    });
  }

  void _scrollToPage(int page) {
    setState(() {
      final double screenWidth = MediaQuery.of(context).size.width;
      _scrollController.animateTo(
        page * screenWidth,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
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
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Card(
          child: Column(
            children: <Widget>[
              Header(),
              Expanded(
                child: PageView.builder(
                    controller: _scrollController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _sections.length,
                    itemBuilder: (BuildContext context, int index) {
                      return  SizedBox(

                          child: QuestionFormWidget(
                            questions: _sections[index].questions!,
                            onPrevious: onPrevious,
                            onNext: onNext,
                            viewModel: widget.formViewModel,
                          ),
                        );
                    },
                  ),
                ),

            ],
          ),
        );
      },
    );
  }

  Widget Header() {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 50, maxHeight: 136),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerLow,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Ajusta ao tamanho dos filhos
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20 ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  _sections[_currentPage].title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            if (_sections.length > 1)
              Flexible(
                child: StepperIndicatorWidget(
                  currentStep: _currentPage,
                  totalSteps: _sections.length,
                  canMarkStepComplete: _isStepCompleted,
                  onStepTapped: _scrollToPage,
                ),
              ),
            if(_sections.length <= 1)const SizedBox(
              height: 10,
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
