import 'package:digprev_flutter/domain/models/enuns/inputType.dart';
import 'package:digprev_flutter/domain/models/question/option.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';
part 'question.g.dart';
@freezed
class Question with _$Question{
  const factory Question({
    required int id,
    required String question,
    required String placeholder,
    required String supportingText,
    required String tooltipText,
    required InputType inputType,
    required List<String>? explanatoryTexts,
    required List<Option>? options,
  }) = _Question;
  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
}


