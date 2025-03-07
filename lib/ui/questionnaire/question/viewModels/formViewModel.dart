import 'dart:async';
import 'package:digprev_flutter/data/repositories/responseCardRepository/responseCardRepository.dart';
import 'package:digprev_flutter/domain/models/answer/answer.dart';
import 'package:digprev_flutter/domain/models/question/question.dart';
import 'package:digprev_flutter/domain/models/responseCard/responseCard.dart';
import 'package:digprev_flutter/domain/models/sectionAnswer/sectionAnswer.dart';
import 'package:flutter/widgets.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

class FormViewModel extends ChangeNotifier {
  FormViewModel({required ResponseCardRepository repository})
    : _repository = repository;
  final ResponseCardRepository _repository;

  late final Command0<ResponseCard> loadComand = Command0<ResponseCard>(_load);

  ResponseCard? _responseCard;

  ResponseCard? get responseCard => _responseCard;

  AsyncResult<ResponseCard> _load() async {
    await _observerPendingOnce();

    final Completer<ResponseCard?> completer = Completer<ResponseCard?>();
    final Duration timeout = const Duration(seconds: 5);

    Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
      if (_responseCard != null) {
        completer.complete(_responseCard);
        timer.cancel();
      }
    });

    return completer.future.timeout(timeout, onTimeout: () => null).then((
      ResponseCard? value,
    ) {
      if (value != null) {
        return Success<ResponseCard, Exception>(value);
      } else {
        return Failure<ResponseCard, Exception>(
          Exception('Falha ao obter o ResponseCard'),
        );
      }
    });
  }

  Future<void> _observerPendingOnce() async {
    await _repository.observerPending().first.then((
      Result<ResponseCard> onData,
    ) {
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

  Map<Question, Answer> _questionAndAnswer = <Question, Answer>{};

  Map<Question, Answer> get questionAndAnswer => _questionAndAnswer;

  late final Command1<bool, List<Question>> joinQuestionCommand;

  AsyncResult<Map<Question, Answer>> _joinQuestionAndAnswer(
    List<Question> questions,
  ) async {
    try {
      final List<Answer> answers = _getAllAnswer();
      Map<Question, Answer> questionAnswerMap = <Question, Answer>{};

      for (Question question in questions) {
        final Answer answer = answers.firstWhere(
          (Answer answer) => answer.questionRef == question.id,
        );
        questionAnswerMap[question] = answer;
      }

      return Success(questionAnswerMap);
    } catch (e) {
      return Failure(Exception('Não foi possível unir: $e'));
    }
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
