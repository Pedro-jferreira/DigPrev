import 'package:digprev_flutter/domain/models/answer/answer.dart';
import 'package:digprev_flutter/domain/models/question/question.dart';
import 'package:digprev_flutter/ui/questionnaire/form/viewModels/formViewModel.dart';
import 'package:digprev_flutter/ui/questionnaire/form/widgets/dynamicFormField.dart';
import 'package:digprev_flutter/ui/questionnaire/form/widgets/navigationButtonsWidget.dart';
import 'package:flutter/material.dart';

class SliverListQuestion extends StatelessWidget {
  const SliverListQuestion({
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
  Widget build(BuildContext context) {
    final List<Question> questions =
        questionAndAnswer.keys.toList()
          ..sort((Question a, Question b) => a.counter.compareTo(b.counter));
    final int length = questions.length;
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        if (index < length) {
          final Question question = questions[index];
          final Answer answer = questionAndAnswer[question]!;

          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            child: _buildDynamicFormField(question, answer),
          );
        } else {
          return NavigationButtonsWidget(
            onPrevious: onPrevious,
            onNext: onNext,
          );
        }
      }, childCount: length + 1),
    );
  }

  Widget _buildDynamicFormField(Question question, Answer answer) {
    return DynamicFormField(
      question: question,
      viewModel: viewModel,
      answer: answer,
    );
  }
}
