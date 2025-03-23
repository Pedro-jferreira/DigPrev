import 'package:digprev_flutter/domain/models/answer/answer.dart';
import 'package:digprev_flutter/domain/models/question/question.dart';
import 'package:digprev_flutter/ui/questionnaire/form/viewModels/formViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/form/widgets/dynamic_Form_Field.dart';
import 'package:digprev_flutter/ui/questionnaire/form/widgets/navigation_Buttons.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ListQuestion extends StatefulWidget {
  const ListQuestion({
    required this.questionAndAnswer,
    required this.onPrevious,
    required this.onNext,
    required this.viewModel,

    super.key,
  });

  final Map<Question, Answer> questionAndAnswer;
  final FormViewModel viewModel;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  @override
  State<ListQuestion> createState() => _ListQuestionState();
}

class _ListQuestionState extends State<ListQuestion> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ScrollOffsetController scrollOffsetController =
      ScrollOffsetController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  final ScrollOffsetListener scrollOffsetListener =
      ScrollOffsetListener.create();
  late List<Question> questions;

  @override
  void initState() {
    super.initState();
    questions =
        widget.questionAndAnswer.keys.toList()
          ..sort((Question a, Question b) => a.counter.compareTo(b.counter));

    /*   WidgetsBinding.instance.addPostFrameCallback((_) {
        Future.delayed(const Duration(milliseconds: 100), () {
          scrollToQuestion(5);
        });
    });*/
  }

  void scrollToQuestion(int index) {
    if (index >= 0 && index < questions.length) {
      itemScrollController.scrollTo(
        index: index,
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
      itemScrollController: itemScrollController,
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
            child: _buildDynamicFormField(question, answer, index),
          );
        } else {
          return NavigationButtons(
            onPrevious: widget.onPrevious,
            onNext:widget.onNext,
          );
        }
      },
      minCacheExtent:15000 ,
    );
  }

  Widget _buildDynamicFormField(Question question, Answer answer, int index) {
    return DynamicFormField(

      question: question,
      viewModel: widget.viewModel,
      answer: answer,
    );
  }

}
