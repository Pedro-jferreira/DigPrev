import 'dart:async';

import 'package:digprev_flutter/data/repositories/responseCardRepository/responseCardRepository.dart';
import 'package:digprev_flutter/domain/models/responseCard/responseCard.dart';
import 'package:digprev_flutter/domain/models/stage/stage.dart';
import 'package:digprev_flutter/domain/useCases/answer_progress/answer_progress.dart';
import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

class ResponseCardViewModel extends ChangeNotifier {
  ResponseCardViewModel({
    required ResponseCardRepository repository,
    required AnswerProgress answerProgress,
  }) : _repository = repository,
       _answerProgress = answerProgress;

  final ResponseCardRepository _repository;
  final AnswerProgress _answerProgress;

  ResponseCard? _responseCard;
  StreamSubscription<Result<ResponseCard>>? _subscription;

  ResponseCard? get responseCard => _responseCard;

  void observerPending() {
    _subscription = _repository.observerPending().listen((
      Result<ResponseCard> onData,
    ) {
      _responseCard = onData.fold(
        (ResponseCard onSuccess) => onSuccess,
        (Exception onFailure) => null,
      );
      if (!_disposed) notifyListeners();
    });
  }

  double getProgress(Stage stage) {
    if (_responseCard != null) {
      return _answerProgress.getQuestionnaireCompletionPercentage(
        stage,
        _responseCard!,
      );
    }
    return 0.0;
  }

  void setComplete() {
    if (_responseCard != null) {
      _repository.update(
        _responseCard!.id,
        _responseCard!.copyWith(isCompleted: true),
      );
    }
  }

  bool _disposed = false;

  @override
  void dispose() {
    _disposed = true;
    _subscription?.cancel();
    super.dispose();
  }
}
