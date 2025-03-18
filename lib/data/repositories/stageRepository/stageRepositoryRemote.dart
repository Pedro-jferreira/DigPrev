import 'package:digprev_flutter/data/repositories/stageRepository/stageRepository.dart';
import 'package:digprev_flutter/data/services/fireStore/stageService.dart';
import 'package:digprev_flutter/domain/models/stage/stage.dart';
import 'package:result_dart/result_dart.dart';

class StageRepositoryRemote implements StageRepository {
  StageRepositoryRemote({required StageService stageServie})
    : _stageService = stageServie;

  final StageService _stageService;

  @override
  AsyncResult<Stage> findById(int id) async {
    return await _stageService.findById(id);
  }

  @override
  Stream<List<Stage>> observeAll() {
    return _stageService.observerAll();
  }

  @override
  AsyncResult<Stage> update(int id, Stage stage) {
    return _stageService.update(id, stage);
  }

  @override
  AsyncResult<List<Stage>> fetchAll() {
   return _stageService.fetchAll();
  }
}
