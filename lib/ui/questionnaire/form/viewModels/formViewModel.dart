import 'dart:async';
import 'package:digprev_flutter/data/repositories/responseCardRepository/responseCardRepository.dart';
import 'package:digprev_flutter/domain/models/answer/answer.dart';
import 'package:digprev_flutter/domain/models/question/question.dart';
import 'package:digprev_flutter/domain/models/responseCard/responseCard.dart';
import 'package:digprev_flutter/domain/models/section/section.dart';
import 'package:digprev_flutter/domain/models/sectionAnswer/sectionAnswer.dart';
import 'package:digprev_flutter/domain/models/stage/stage.dart';
import 'package:digprev_flutter/domain/useCases/answer_progress/answer_progress.dart';
import 'package:digprev_flutter/utils/helpers/sectionHelper.dart';
import 'package:flutter/widgets.dart';
import 'package:result_dart/result_dart.dart';

class FormViewModel extends ChangeNotifier {
  FormViewModel({
    required ResponseCardRepository repository,
    required AnswerProgress answerProgress,
  }) : _repository = repository,
       _answerProgress = answerProgress;
  final ResponseCardRepository _repository;
  final AnswerProgress _answerProgress;

  ResponseCard? _responseCard;

  ResponseCard? get responseCard => _responseCard;

  Map<Question, Answer> _questionAndAnswer = <Question, Answer>{};

  Map<Question, Answer> get questionAndAnswer => _questionAndAnswer;

  StreamSubscription<Result<ResponseCard>> observerPending() {
    return _repository.observerPending().listen((Result<ResponseCard> onData) {
      _responseCard = onData.fold(
        (ResponseCard onSuccess) => onSuccess,
        (Exception onFailure) => null,
      );
      notifyListeners();
    });
  }

  Future<void> update(Answer value, String questionId) async {
    if (_responseCard != null) {
      final List<SectionAnswer> updatedSections = <SectionAnswer>[];
      for (SectionAnswer section in _responseCard!.sections) {
        final List<SectionAnswer> updatedSubSections = <SectionAnswer>[];
        if (section.subSectionsAnswers != null) {
          for (SectionAnswer subS in section.subSectionsAnswers!) {
            subS = subS.copyWith(
              answers:
                  subS.answers.map((Answer answer) {
                    return (answer.questionRef == questionId) ? value : answer;
                  }).toList(),
            );
            updatedSubSections.add(subS);
          }
        }
        section = section.copyWith(
          answers:
              section.answers.map((Answer answer) {
                return (answer.questionRef == questionId) ? value : answer;
              }).toList(),
          subSectionsAnswers:
              updatedSubSections.isEmpty ? null : updatedSubSections,
        );
        updatedSections.add(section);
      }
      _responseCard = _responseCard!.copyWith(sections: updatedSections);
      await _repository.update(_responseCard!.id, _responseCard!);
    }
  }

  Map<Question, Answer> joinQuestionAndAnswer(List<Question> questions) {
    final List<Answer> answers = _getAllAnswer();
    final Map<Question, Answer> questionAnswerMap = <Question, Answer>{};

    for (Question q in questions) {
      for (Answer a in answers) {
        if (a.questionRef == q.id.toString()) {
          questionAnswerMap[q] = a;
        }
      }
    }
    return questionAnswerMap;
  }

  List<Answer> _getAllAnswer() {
    final List<Answer> answers = <Answer>[];
    if (_responseCard != null) {
      for (SectionAnswer sections in _responseCard!.sections) {
        if (sections.subSectionsAnswers != null) {
          for (SectionAnswer sections in sections.subSectionsAnswers!) {
            for (Answer answer in sections.answers) {
              answers.add(answer);
            }
          }
        }
        for (Answer answer in sections.answers) {
          answers.add(answer);
        }
      }
    }
    return answers;
  }

  bool isScroll(Stage stage, Section section) {
    if (SectionHelper.flattenSections(stage)[_page.$1].id == section.id)
      return true;

    return false;
  }

  (int, int) _page = (0, 0);

  (int, int) get page => _page;

  (int section, int question) findLastPage(Stage stage) {
    if (_responseCard != null) {
      final (int, int) number = _answerProgress
          .getLastAnsweredQuestionnairePosition(stage, _responseCard!);
      _page = number;
      return number;
    }

    return (0, 0);
  }
}
