import 'package:digprev_flutter/data/repositories/stageRepository/stageRepository.dart';
import 'package:digprev_flutter/domain/models/responseCard/responseCard.dart';
import 'package:digprev_flutter/domain/models/section/section.dart';
import 'package:digprev_flutter/domain/models/stage/stage.dart';
import 'package:digprev_flutter/domain/useCases/answer_progress/answer_progress.dart';
import 'package:flutter/material.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

class SectionViewModel extends ChangeNotifier {
  final StageRepository _stageRepository;
  final AnswerProgress _answerProgress;

  SectionViewModel({
    required StageRepository stageRepository,
    required AnswerProgress answerProgress,
  }) : _stageRepository = stageRepository,
       _answerProgress = answerProgress;
  late final Command1<Stage, int> loadComand = Command1<Stage, int>(_load);

  AsyncResult<Stage> _load(int stageId) async {
    return _stageRepository.findById(stageId);
  }

  bool isCompleted(ResponseCard responseCard, Section section) {
    final double result = 0.8;
    return (result == 1.0) ? true : false;
  }
}
