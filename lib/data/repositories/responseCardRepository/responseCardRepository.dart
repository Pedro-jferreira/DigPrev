import 'package:digprev_flutter/domain/models/responseCard/responseCard.dart';
import 'package:result_dart/result_dart.dart';

abstract class ResponseCardRepository {
  AsyncResult<ResponseCard> save(ResponseCard responseCard);

  AsyncResult<ResponseCard> update(String id, ResponseCard responseCard);

  AsyncResult<ResponseCard> findById(String id);

  Stream<Result<ResponseCard>> observerById(String id);

  Stream<Result<ResponseCard>> observerPending();

  Stream<List<ResponseCard>> observerAll();

  Stream<List<ResponseCard>> observerAllCompleted();
}
