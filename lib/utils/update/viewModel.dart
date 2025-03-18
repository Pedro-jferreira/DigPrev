import 'package:digprev_flutter/data/repositories/stageRepository/stageRepository.dart';
import 'package:digprev_flutter/domain/models/stage/stage.dart';
import 'package:flutter/material.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

class ViewModel extends ChangeNotifier {
  ViewModel({required StageRepository stageRepository})
      : _stageRepository = stageRepository;

  final StageRepository _stageRepository;


  late  final Command1<Stage, int> loadComand = Command1<Stage, int>(_load);

  AsyncResult<Stage> _load(int stageId) async{
    return _stageRepository.findById(stageId);
  }

  update(int id, Stage stage){
    _stageRepository.update(id, stage).fold(
        (Stage onSuccess) => onSuccess,
        (Exception onError)=> onError);
  }

}
