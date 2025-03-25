import 'package:digprev_flutter/domain/models/responseCard/responseCard.dart';
import 'package:digprev_flutter/domain/models/stage/stage.dart';

abstract class AnswerProgress {
  (int sectionId, int questionId) getLastAnsweredQuestionnairePosition(
      Stage stage,
      ResponseCard responseCard,
  );



  double getQuestionnaireCompletionPercentage(
    Stage stage,
    ResponseCard responseCard,
  );


}
