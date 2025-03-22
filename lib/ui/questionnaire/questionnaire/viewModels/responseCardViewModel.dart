import 'dart:async';

import 'package:digprev_flutter/data/repositories/responseCardRepository/responseCardRepository.dart';
import 'package:digprev_flutter/domain/models/answer/answer.dart';
import 'package:digprev_flutter/domain/models/responseCard/responseCard.dart';
import 'package:digprev_flutter/domain/models/section/section.dart';
import 'package:digprev_flutter/domain/models/sectionAnswer/sectionAnswer.dart';
import 'package:digprev_flutter/domain/models/stage/stage.dart';
import 'package:digprev_flutter/domain/useCases/answer_progress/answer_progress.dart';
import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

class ResponseCardViewModel extends ChangeNotifier {
  ResponseCardViewModel({required ResponseCardRepository repository, required AnswerProgress answerProgress})
    : _repository = repository, _answerProgress = answerProgress;
  final ResponseCardRepository _repository;
  final AnswerProgress _answerProgress;

  ResponseCard? _responseCard;

  ResponseCard? get responseCard => _responseCard;

  StreamSubscription<Result<ResponseCard>> observerPending({required void Function(int) funcao}) {
    return _repository.observerPending().listen((Result<ResponseCard> onData) {
      _responseCard = onData.fold(
        (ResponseCard onSuccess) => onSuccess,
        (Exception onFailure) => null,
      );
      notifyListeners();
    });
  }

  double getProgress(Stage stage) {
    if (_responseCard != null) {
      double progress =_answerProgress.getQuestionnaireCompletionPercentage(
          stage,
          responseCard!);

      debugPrint('porcentagem:${progress}');
     return progress;
    }

    return 0.0;
  }


}
