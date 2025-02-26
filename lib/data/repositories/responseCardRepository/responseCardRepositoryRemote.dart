import 'package:digprev_flutter/data/repositories/responseCardRepository/responseCardRepository.dart';
import 'package:digprev_flutter/data/services/fireStore/responseCardService.dart';
import 'package:digprev_flutter/domain/models/responseCard/responseCard.dart';
import 'package:result_dart/result_dart.dart';

class ResponseCardRepositoryRemote implements ResponseCardRepository {
  ResponseCardRepositoryRemote({
    required ResponseCardService responseCardService,
  }) : _responseCardService = responseCardService;

  final ResponseCardService _responseCardService;

  @override
  AsyncResult<ResponseCard> save(ResponseCard responseCard) async {
    return await _responseCardService.save(responseCard);
  }

  @override
  AsyncResult<ResponseCard> update(String id, ResponseCard responseCard) async {
    return await _responseCardService.update(id, responseCard);
  }

  @override
  AsyncResult<ResponseCard> findById(String id) async {
    return await _responseCardService.findById(id);
  }

  @override
  Stream<List<ResponseCard>> observerAll() {
    return _responseCardService.observerAll();
  }

  @override
  Stream<List<ResponseCard>> observerAllCompleted() {
    return _responseCardService.observerAllCompleted();
  }

  @override
  Stream<Result<ResponseCard>> observerById(String id) {
    return _responseCardService.observerById(id);
  }

  @override
  Stream<Result<ResponseCard>> observerPending() {
    return _responseCardService.observerPending();
  }
}
