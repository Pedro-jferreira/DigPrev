import 'package:digprev_flutter/domain/models/responseCard/responseCard.dart';
import 'package:digprev_flutter/domain/models/section/section.dart';
import 'package:digprev_flutter/domain/models/sectionAnswer/sectionAnswer.dart';
import 'package:digprev_flutter/domain/models/stage/stage.dart';

abstract class AnswerProgress {
  (int sectionId, int questionId) getLastAnsweredQuestionnairePosition(
      int stageId,
    ResponseCard responseCard,
  );

  int getLastAnsweredSectionPosition(SectionAnswer sectionAnswer);

  double getQuestionnaireCompletionPercentage(
    Stage stage,
    ResponseCard responseCard,
  );

  double getSectionCompletionPercentage(
      Section section,
      ResponseCard responseCard,);
}
