
import 'package:digprev_flutter/data/repositories/responseCardRepository/responseCardRepository.dart';
import 'package:digprev_flutter/data/repositories/stageRepository/stageRepository.dart';
import 'package:digprev_flutter/domain/models/responseCard/responseCard.dart';
import 'package:digprev_flutter/domain/models/section/section.dart';
import 'package:digprev_flutter/domain/models/sectionAnswer/sectionAnswer.dart';
import 'package:digprev_flutter/domain/models/stage/stage.dart';
import 'package:flutter/cupertino.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

class ReportViewModel extends ChangeNotifier {
  ReportViewModel({
    required StageRepository stageRepository,
    required ResponseCardRepository responseCardRepository,
  }) : _stageRepository = stageRepository,
       _responseCardRepository = responseCardRepository;

  final StageRepository _stageRepository;
  final ResponseCardRepository _responseCardRepository;

  late final Command1<ResponseCard, String> findByIdCommand =
      Command1<ResponseCard, String>(_findById);

  late final Command0<List<Stage>> loadComand = Command0<List<Stage>>(
    _fetchAll,
  );

  Future<void> loadStages() async {
    await loadComand.execute();
    notifyListeners();
  }

  Future<void> loadResponse(String id) async {
    await findByIdCommand.execute(id);
    notifyListeners();
  }


  AsyncResult<ResponseCard> _findById(String id) async {
    return await _responseCardRepository.findById(id);
  }

  AsyncResult<List<Stage>> _fetchAll() async {
    return await _stageRepository.fetchAll();
  }

  Map<Section, SectionAnswer> joinSectionAndAnswer (
    List<Stage> stages,
    ResponseCard responseCard,
  ) {

    final Map<Section, SectionAnswer> sectionAnswerMap =
        <Section, SectionAnswer>{};

    for (Stage stage in stages) {
      for (Section section in stage.sections) {
       for(SectionAnswer answer in responseCard.sections){
         if(answer.sectionRef == section.id){
           if(answer.hasChart) sectionAnswerMap[section] = answer;
         }
       }
      }
    }
    return sectionAnswerMap;
  }
}
