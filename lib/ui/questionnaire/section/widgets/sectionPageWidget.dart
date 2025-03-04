import 'package:digprev_flutter/domain/models/section/section.dart';
import 'package:digprev_flutter/domain/models/stage/stage.dart';
import 'package:digprev_flutter/ui/questionnaire/section/viewModels/sectionViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/section/widgets/questionFormWidget.dart';
import 'package:digprev_flutter/ui/questionnaire/section/widgets/stepperIndicatorWidget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:result_command/result_command.dart';

class SectionPageWidget extends StatefulWidget {
  final String stageId;
  final SectionViewModel viewModel;

  const SectionPageWidget({
    required this.stageId,
    required this.viewModel,
    super.key,
  });

  @override
  State<SectionPageWidget> createState() => SectionPageState();
}

class SectionPageState extends State<SectionPageWidget> {
   List<Section> _sections = <Section>[];
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    // Adicionando o listener para o comando
    widget.viewModel.loadComand.addListener(_onCommandStateChanged);
    widget.viewModel.loadComand.execute(int.parse(widget.stageId));
  }

  @override
  void dispose() {
    widget.viewModel.loadComand.removeListener(_onCommandStateChanged);
    super.dispose();
  }

  void _onCommandStateChanged() {
    final CommandState<Stage> snapshot = widget.viewModel.loadComand.value;
    if (snapshot is SuccessCommand<Stage>) {
      setState(() {
        _sections = snapshot.value.sections!;
      });
    } else if (snapshot is FailureCommand<Stage>) {
      print('Error: ${snapshot.error}');
    }
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Adiciona um post frame callback para garantir que o scroll só será realizado depois que o widget for completamente construído.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final snapshot = widget.viewModel.loadComand.value;
        if (snapshot is SuccessCommand<Stage>) {
          _scrollToPage(0);
        } else if (snapshot is FailureCommand<Stage>) {
          final error = snapshot.error;
          print('Error: $error');
        }
      }
    });
  }
  void onNext() {
    setState(() {
      if (_currentPage < _sections.length - 1) {
        _currentPage++;
        _scrollToPage(_currentPage);
      } else context.go('/');
    });
  }

  void onPrevious() {
    setState(() {
      if (_currentPage > 0) {
        _currentPage--;
        _scrollToPage(_currentPage);
      }else context.go('/');
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
    }
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double availableHeight = constraints.maxHeight;

        return Column(
          children: <Widget>[
            if (widget.viewModel.loadComand.isSuccess)
              SizedBox(
                height: availableHeight * 0.05,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _sections[_currentPage].title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
              ),
            SizedBox(
              height: availableHeight * 0.11,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: _sections.length < 3 ? 70 : 0,
                ),
                child: StepperIndicatorWidget(
                  currentStep: _currentPage,
                  totalSteps: _sections.length,
                  canMarkStepComplete: _isStepCompleted,
                  onStepTapped: _scrollToPage,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: _sections.length,
                itemBuilder: (BuildContext context, int index) {
                  return QuestionFormWidget(
                    questions: _sections[index].questions,
                    onPrevious: onPrevious,
                    onNext: onNext,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
