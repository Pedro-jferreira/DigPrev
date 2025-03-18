import 'package:digprev_flutter/data/repositories/responseCardRepository/responseCardRepository.dart';
import 'package:digprev_flutter/data/repositories/stageRepository/stageRepository.dart';
import 'package:digprev_flutter/domain/models/answer/answer.dart';
import 'package:digprev_flutter/domain/models/question/option.dart';
import 'package:digprev_flutter/domain/models/question/question.dart';
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
  })  : _stageRepository = stageRepository,
        _responseCardRepository = responseCardRepository;

  @override
  AsyncResult<ResponseCard> generate() async {
    final List<Stage> stages = await _stageRepository.observeAll().first;

    final List<SectionAnswer> sectionsAnswer =
    stages.expand((Stage stage) => _buildSectionAnswers(stage)).toList();

    final ResponseCard responseCard = ResponseCard(
      id: ObjectId().hexString,
      userRef: null,
      date: DateTime.now(),
      sections: sectionsAnswer,
      isCalculated: false,
      isCompleted: false,
    );

    return _responseCardRepository.save(responseCard);
  }

  List<SectionAnswer> _buildSectionAnswers(Stage stage) {
    return stage.sections.map((Section section) =>
        _buildSectionAnswer(section)).toList();
  }

  SectionAnswer _buildSectionAnswer(Section section) {
    final List<SectionAnswer>? subSectionsAnswers =
    _buildSubSectionAnswers(section);

    final List<Answer> answers =
    section.questions.map(_buildAnswer).toList();

    return SectionAnswer(
      id: ObjectId().hexString,
      title: section.title,
      sectionRef: section.id,
      answers: answers,
      subSectionsAnswers: subSectionsAnswers,
      score: 0.0,
      isCalculated: false,
      hasChart: section.hasChart
    );
  }

  List<SectionAnswer>? _buildSubSectionAnswers(Section section) {
    if (section.subSections == null || section.questions.isNotEmpty) {
      return null;
    }

    return section.subSections!
        .map((Section subSection) => _buildSectionAnswer(subSection))
        .toList();
  }

  Answer _buildAnswer(Question question) {
    return Answer(
      id: ObjectId().hexString,
      questionRef: question.id,
      date: DateTime.now(),
      answers: <Option>[],
    );
  }
}

