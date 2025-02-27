import 'package:digprev_flutter/domain/models/responseCard/responseCard.dart';
import 'package:result_dart/result_dart.dart';

abstract class ResponseCardGenerator{
  AsyncResult<ResponseCard> generate();
}