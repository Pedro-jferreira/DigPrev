import 'package:digprev_flutter/domain/models/stage/stage.dart';
import 'package:result_dart/result_dart.dart';

abstract class StageRepository {
  Stream<List<Stage>> observeAll();
  AsyncResult<Stage> findById(int id);
  AsyncResult<List<Stage>> fetchAll();
  AsyncResult<Stage> update(int id, Stage stage);
}