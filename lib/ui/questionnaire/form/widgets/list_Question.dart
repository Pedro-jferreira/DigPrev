import 'package:digprev_flutter/domain/models/answer/answer.dart';
import 'package:digprev_flutter/domain/models/question/question.dart';
import 'package:digprev_flutter/domain/models/section/section.dart';
import 'package:digprev_flutter/domain/models/stage/stage.dart';
import 'package:digprev_flutter/ui/questionnaire/form/viewModels/formViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/form/widgets/dynamic_Form_Field.dart';
import 'package:digprev_flutter/ui/questionnaire/form/widgets/navigation_Buttons.dart';
import 'package:flutter/material.dart';

class ListQuestion extends StatefulWidget {
  const ListQuestion({
    required this.formKey,
    required this.questionAndAnswer,
    required this.onPrevious,
    required this.onNext,
    required this.viewModel,
    required this.stage,
    required this.section,
    super.key,
  });

  final Map<Question, Answer> questionAndAnswer;
  final FormViewModel viewModel;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final Stage stage;
  final Section section;
  final GlobalKey<FormState> formKey;

  @override
  State<ListQuestion> createState() => _ListQuestionState();
}

class _ListQuestionState extends State<ListQuestion> {
  final ScrollController _scrollController = ScrollController();
  final Map<int, GlobalKey> _questionKeys =
      <int, GlobalKey<State<StatefulWidget>>>{};

  late List<Question> questions;
  List<String> disabled = <String>[];

  @override
  void initState() {
    super.initState();
    questions =
        widget.questionAndAnswer.keys.toList()
          ..sort((Question a, Question b) => a.counter.compareTo(b.counter));
    for (Question question in questions) {
      _questionKeys[question.counter] = GlobalKey();
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.viewModel.isScroll(widget.stage, widget.section))
        scrollToQuestion(widget.viewModel.page.$2);
    });
  }

  void scrollToQuestion(int index) {
    final BuildContext? keyContext = _questionKeys[index]?.currentContext;
    if (keyContext == null || !mounted) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      final RenderObject? renderBox = keyContext.findRenderObject();
      if (renderBox is RenderBox) {
        final Offset position = renderBox.localToGlobal(
          Offset.zero,
          ancestor: context.findRenderObject(),
        );
        final double offset = position.dy + _scrollController.offset;
        _scrollController.animateTo(
          offset,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: <Widget>[
                ...questions.map((Question question) {
                  final Answer answer = widget.questionAndAnswer[question]!;
                  return Padding(
                    key: _questionKeys[question.counter],
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    child: _buildDynamicFormField(question, answer),
                  );
                }).toList(),
                NavigationButtons(
                  onPrevious: () {
                    widget.viewModel.findLastPage(widget.stage);
                    if (widget.viewModel.page.$2 != 0)
                      scrollToQuestion(widget.viewModel.page.$2);

                    widget.onPrevious();
                  },
                  onNext: () {
                    widget.viewModel.findLastPage(widget.stage);
                    if (widget.viewModel.page.$2 != 0)
                      scrollToQuestion(widget.viewModel.page.$2);

                    widget.onNext();
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDynamicFormField(Question question, Answer answer) {
    return DynamicFormField(
      disabled: disabled,
      question: question,
      viewModel: widget.viewModel,
      answer: answer,
    );
  }
}
