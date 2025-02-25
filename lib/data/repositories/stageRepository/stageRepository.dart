import 'package:digprev_flutter/domain/models/stage/stage.dart';
import 'package:digprev_flutter/utils/result.dart';

abstract class StageRepository {
  Stream<List<Stage>> observeAll();

  Future<Result<Stage>> findById(int id);
}