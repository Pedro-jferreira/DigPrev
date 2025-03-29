import 'package:digprev_flutter/domain/models/enums/inputType.dart';
import 'package:digprev_flutter/domain/models/question/explanatoryTexts.dart';
import 'package:digprev_flutter/domain/models/question/option.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';

part 'question.g.dart';

@freezed
class Question with _$Question {
  const factory Question({
    required String id,
    required int counter,
    required String question,
    required String placeholder,
    required String supportingText,
    required String tooltipText,
    required InputType inputType,
    required List<ExplanatoryTexts>? explanatoryTexts,
    required List<Option> optionsQuestions,
    required List<String>? disableQuestions,
    required bool? exclusiveLastItem,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}
