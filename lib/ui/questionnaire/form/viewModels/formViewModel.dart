import 'dart:async';
import 'package:digprev_flutter/data/repositories/responseCardRepository/responseCardRepository.dart';
import 'package:digprev_flutter/domain/models/answer/answer.dart';
import 'package:digprev_flutter/domain/models/question/question.dart';
import 'package:digprev_flutter/domain/models/responseCard/responseCard.dart';
import 'package:digprev_flutter/domain/models/sectionAnswer/sectionAnswer.dart';
import 'package:flutter/widgets.dart';
import 'package:result_dart/result_dart.dart';

class FormViewModel extends ChangeNotifier {
  FormViewModel({required ResponseCardRepository repository})
    : _repository = repository;
  final ResponseCardRepository _repository;
  ResponseCard? _responseCard;

  ResponseCard? get responseCard => _responseCard;
  Map<Question, Answer> _questionAndAnswer = <Question, Answer>{};

  Map<Question, Answer> get questionAndAnswer => _questionAndAnswer;

  StreamSubscription<Result<ResponseCard>> observerPending(
    List<Question> questions,
  ) {
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
      final List<SectionAnswer> updatedSections =
          _responseCard!.sections.map((SectionAnswer section) {
            return section.copyWith(
              answers:
                  section.answers.map((Answer answer) {
                    return (answer.questionRef == questionId) ? value : answer;
                  }).toList(),
            );
          }).toList();
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
        for (Answer answer in sections.answers) {
          answers.add(answer);
        }
      }
    }
    return answers;
  }
}
