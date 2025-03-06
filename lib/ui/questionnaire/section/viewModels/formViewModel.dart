import 'dart:async';
import 'package:digprev_flutter/data/repositories/responseCardRepository/responseCardRepository.dart';
import 'package:digprev_flutter/domain/models/answer/answer.dart';
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

  Future<Answer?> fetchAnswerByQuestionId(String id) async {
    if (_responseCard != null) {
      for (SectionAnswer section in _responseCard!.sections) {
        for (Answer answer in section.answers) {
          if (answer.questionRef == id) return answer;
        }
      }
    }
    return null; // Retorna null em vez de lançar uma exceção
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
}
