import 'package:digprev_flutter/data/repositories/stageRepository/stageRepository.dart';
import 'package:digprev_flutter/data/services/fireStore/stageService.dart';
import 'package:digprev_flutter/domain/models/stage/stage.dart';
import 'package:digprev_flutter/utils/result.dart';

class StageRepositoryRemote implements StageRepository {
  StageRepositoryRemote({required StageService stageServie})
    : _stageService = stageServie;

  final StageService _stageService;

  @override
  Future<Result<Stage>> findById(int id) async {
    return await _stageService.findById(id);
  }

  @override
  Stream<List<Stage>> observeAll() {
    return _stageService.observerAll();
  }
}
