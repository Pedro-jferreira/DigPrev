import 'package:digprev_flutter/domain/models/answer/answer.dart';
import 'package:digprev_flutter/domain/models/enums/inputType.dart';
import 'package:digprev_flutter/domain/models/question/question.dart';
import 'package:digprev_flutter/domain/models/responseCard/responseCard.dart';
import 'package:digprev_flutter/domain/models/section/section.dart';
import 'package:digprev_flutter/domain/models/sectionAnswer/sectionAnswer.dart';
import 'package:digprev_flutter/domain/models/stage/stage.dart';
import 'package:digprev_flutter/domain/useCases/answer_progress/answer_progress.dart';
import 'package:digprev_flutter/utils/helpers/sectionHelper.dart';

class AnswerProgressImpl extends AnswerProgress {
  AnswerProgressImpl();

  @override
  (int, int) getLastAnsweredQuestionnairePosition(
    Stage stage,
    ResponseCard responseCard,
  ) {
    int sectionIndex = -1;
    int lastQuestion = 0;
    for (Section section in SectionHelper.flattenSections(stage)) {
      sectionIndex++;
      for (SectionAnswer sectionAnswer in SectionHelper.flattenSectionAnswer(
        responseCard,
      )) {
        if (sectionAnswer.sectionRef == section.id) {
          lastQuestion = _findLastAnsweredQuestion(
            section,   sectionAnswer,
          );

          if(lastQuestion == 0) continue;

          return (sectionIndex, lastQuestion);
        }
      }
    }

    if(lastQuestion == 0) return (0,0);
    return (sectionIndex, lastQuestion);
  }



  @override
  double getQuestionnaireCompletionPercentage(
    Stage stage,
    ResponseCard responseCard,
  ) {
    double total = 0.0;
    final int sectionCount = SectionHelper.flattenSections(stage).length;

    for (Section section in SectionHelper.flattenSections(stage)) {
      final SectionAnswer? sectionAnswer = SectionHelper.flattenSectionAnswer(
        responseCard,
      ).firstWhere((SectionAnswer s) => s.sectionRef == section.id);

      total += _calculateSectionCompletion(section, sectionAnswer);
    }
    if (sectionCount == 0) return 0.0;

    return total / sectionCount;
  }


  double _calculateSectionCompletion(
    Section section,
    SectionAnswer? sectionAnswer,
  ) {
    final List<String> disabledQuestions = <String>[];
    int totalConsidered = 0;
    int totalAnswered = 0;

    for (Question question in section.questions) {
      if (disabledQuestions.contains(question.id)) continue;

      final Answer? answer = sectionAnswer?.answers.firstWhere(
        (Answer a) => a.questionRef == question.id,
      );

      final bool isAnswered = answer != null && answer.answers.isNotEmpty;
      totalConsidered++;

      if (isAnswered) {
        totalAnswered++;

        if (question.disableQuestions != null &&
            question.disableQuestions!.isNotEmpty) {
          if ((question.inputType == InputType.SIM_NAO &&
                  answer.answers.first.text == 'Não') ||
              (question.inputType == InputType.FREQUENCY_TIME &&
                  answer.answers.first.noneOption == true)) {
            disabledQuestions.addAll(question.disableQuestions!);
          }
        }
      }
    }

    if (totalConsidered == 0) return 0.0;
    return totalAnswered / totalConsidered;
  }

  int _findLastAnsweredQuestion(Section section, SectionAnswer sectionAnswer) {
    final List<String> disabledQuestions = <String>[];

    for (Question question in section.questions) {
      for (Answer answer in sectionAnswer.answers) {
        if (answer.questionRef == question.id) {
          _updateDisabledQuestions(question, answer, disabledQuestions);

          if (_isQuestionDisabledOrUnanswered(answer, disabledQuestions)) {
            print("$disabledQuestions");
            print('_findLastAnsweredQuestion ${question.counter }');
            return question.counter ;
          }
        }
      }
    }

    return 0;
  }

  void _updateDisabledQuestions(
    Question question,
    Answer answer,
    List<String> disabledQuestions,
  ) {
    if (question.disableQuestions != null &&
        question.disableQuestions!.isNotEmpty &&
        answer.answers.isNotEmpty) {
      if (question.inputType == InputType.SIM_NAO &&
              answer.answers.first.text == 'Não' ||
          question.inputType == InputType.FREQUENCY_TIME &&
              answer.answers.first.noneOption == true) {
        disabledQuestions.addAll(question.disableQuestions!);
      }
    }
  }

  bool _isQuestionDisabledOrUnanswered(
    Answer answer,
    List<String> disabledQuestions,
  ) {
    if(disabledQuestions.contains(answer.questionRef)) return false;
    if(answer.answers.isEmpty) return true;

    return false;
  }
}
