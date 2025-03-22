import 'package:digprev_flutter/data/repositories/responseCardRepository/responseCardRepository.dart';
import 'package:digprev_flutter/domain/models/responseCard/responseCard.dart';
import 'package:digprev_flutter/domain/useCases/responseCardGenerator/responseCardGenerator.dart';
import 'package:flutter/material.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

class RestartViewModel extends ChangeNotifier {
  RestartViewModel({
    required ResponseCardGenerator cardGenerator,
    required ResponseCardRepository repository,
  }) : _cardGenerator = cardGenerator,
       _repository = repository;

  final ResponseCardGenerator _cardGenerator;
  final ResponseCardRepository _repository;

  ResponseCard? _responseCard;
  ResponseCard? get responseCard => _responseCard;

  late Command0<ResponseCard> generateCardResponse = Command0<ResponseCard>(
    _generate,
  );

  void observerPending() {
    _repository.observerPending().listen((Result<ResponseCard> onData) {
      _responseCard = onData.fold(
        (ResponseCard onSuccess) => onSuccess,
        (Exception onFailure) => null,
      );
      notifyListeners();
    });
  }

  AsyncResult<ResponseCard> _generate() {
    return _cardGenerator.generate();
  }
}
