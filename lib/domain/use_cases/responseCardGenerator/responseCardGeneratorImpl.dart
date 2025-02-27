import 'package:digprev_flutter/data/repositories/responseCardRepository/responseCardRepository.dart';
import 'package:digprev_flutter/data/repositories/stageRepository/stageRepository.dart';
import 'package:digprev_flutter/domain/models/answer/answer.dart';
import 'package:digprev_flutter/domain/models/question/option.dart';
import 'package:digprev_flutter/domain/models/responseCard/responseCard.dart';
import 'package:digprev_flutter/domain/models/section/section.dart';
import 'package:digprev_flutter/domain/models/sectionAnswer/sectionAnswer.dart';
import 'package:digprev_flutter/domain/models/stage/stage.dart';
import 'package:digprev_flutter/domain/use_cases/responseCardGenerator/responseCardGenerator.dart';
import 'package:objectid/objectid.dart';
import 'package:result_dart/src/types.dart';

class ResponseCardGeneratorImpl implements ResponseCardGenerator {
  final StageRepository _stageRepository;
  final ResponseCardRepository _responseCardRepository;

  ResponseCardGeneratorImpl({
    required StageRepository stageRepository,
    required ResponseCardRepository responseCardRepository,
  }) : _stageRepository = stageRepository,
       _responseCardRepository = responseCardRepository;

  @override
  AsyncResult<ResponseCard> generate() async {
    final List<Stage> stages = await _stageRepository.observeAll().first;

    final List<SectionAnswer> sectionsAnswer =
        stages
            .expand((Stage stage) => stage.sections ?? <Section>[])
            .map(
              (dynamic section) => SectionAnswer(
                id:  ObjectId().hexString,
                title: section.title,
                sectionRef: section.id.toString(),
                answers:
                    section.questions
                        .map<Answer>(
                          (dynamic question) => Answer(
                            id:  ObjectId().hexString,
                            questionRef: question.id.toString(),
                            date: DateTime.now(),
                            answers: <Option>[],
                          ),
                        )
                        .toList(),
                score: 0.0,
                isCalculated: false,
              ),
            )
            .toList();

    final ResponseCard responseCard = ResponseCard(
      id:  ObjectId().hexString,
      userRef: null,
      date: DateTime.now(),
      sections: sectionsAnswer,
      isCalculated: false,
      isCompleted: false,
    );

    return _responseCardRepository.save(responseCard);
  }
}
