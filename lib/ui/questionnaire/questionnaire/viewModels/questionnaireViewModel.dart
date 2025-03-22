import 'dart:async';
import 'package:digprev_flutter/data/repositories/stageRepository/stageRepository.dart';
import 'package:digprev_flutter/domain/models/stage/stage.dart';
import 'package:flutter/material.dart';

class QuestionnaireViewModel extends ChangeNotifier {
  QuestionnaireViewModel({required StageRepository stageRepository})
    : _stageRepository = stageRepository;

  final StageRepository _stageRepository;
  List<Stage> _stages = <Stage>[];

  List<Stage> get stages => _stages;

  StreamSubscription<List<Stage>>? _stagesSubscription;

  int _currentStageIndex = 0;
  int get currentStageIndex => _currentStageIndex;
  void setCurrentIndex(int index){
    _currentStageIndex = index;
    notifyListeners();
  }

  void init(){
    _observeStages();
  }
  Future<Null> refresh() async{
    _stagesSubscription?.pause();
     _currentStageIndex = 0;
    _stages = <Stage>[];
    return  await Future<Null>.delayed(const Duration(seconds: 2), () {
      _observeStages();
      _stagesSubscription?.resume();
    });
}

  void _observeStages() {
    _stagesSubscription = _stageRepository.observeAll().listen(
      (List<Stage> newStages) {
        _stages = newStages;
        _currentStageIndex = 0;
        notifyListeners();
      },
      onError:
          (dynamic error) => debugPrint('Erro ao observar estágios: $error'),
    );
  }

  @override
  void dispose() {
    _stagesSubscription?.cancel();
    super.dispose();
  }
}
