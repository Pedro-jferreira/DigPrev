import 'package:digprev_flutter/domain/models/answer/answer.dart';
import 'package:digprev_flutter/domain/models/question/question.dart';
import 'package:digprev_flutter/ui/questionnaire/form/widgets/dynamic_Form_Field.dart';
import 'package:digprev_flutter/ui/questionnaire/form/widgets/navigation_Buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ListQuestion extends StatefulWidget {
  const ListQuestion({
    required this.questionAndAnswer,
    required this.onPrevious,
    required this.onNext,
    required this.itemScrollController,
    super.key,
  });

  final Map<Question, Answer> questionAndAnswer;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final ItemScrollController itemScrollController;

  @override
  State<ListQuestion> createState() => _ListQuestionState();
}

class _ListQuestionState extends State<ListQuestion> {
  final ScrollOffsetController scrollOffsetController =
  ScrollOffsetController();
  final ItemPositionsListener itemPositionsListener =
  ItemPositionsListener.create();
  final ScrollOffsetListener scrollOffsetListener =
  ScrollOffsetListener.create();
  late List<Question> questions;
  List<String> disabled = <String>[];

  @override
  void initState() {
    super.initState();
    questions =
        widget.questionAndAnswer.keys.toList()
          ..sort((Question a, Question b) => a.counter.compareTo(b.counter));
  }

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
      itemScrollController: widget.itemScrollController,
      scrollOffsetController: scrollOffsetController,
      itemPositionsListener: itemPositionsListener,
      scrollOffsetListener: scrollOffsetListener,
      itemCount: questions.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index < questions.length) {
          final Question question = questions[index];
          final Answer answer = widget.questionAndAnswer[question]!;
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            child: _buildDynamicFormField(question, answer),
          );
        } else {
          return NavigationButtons(
            onPrevious: widget.onPrevious,
            onNext: widget.onNext
          );
        }
      },
    );
  }

  Widget _buildDynamicFormField(Question question, Answer answer) {
    return DynamicFormField(
      disabled: disabled,
      question: question,
      viewModel: context.read(),
      answer: answer,
    );
  }
}
