import 'package:digprev_flutter/data/repositories/stageRepository/stageRepository.dart';
import 'package:digprev_flutter/domain/models/stage/stage.dart';
import 'package:flutter/material.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

class SectionViewModel extends ChangeNotifier {
  final StageRepository _stageRepository;
  SectionViewModel({required StageRepository stageRepository})
      : _stageRepository = stageRepository;
  late  final Command1<Stage, int> loadComand = Command1<Stage, int>(_load);

  AsyncResult<Stage> _load(int stageId) async{
    return _stageRepository.findById(stageId);
  }

}
