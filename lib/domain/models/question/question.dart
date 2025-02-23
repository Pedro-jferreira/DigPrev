import 'dart:convert';

import 'package:digprev_flutter/domain/models/enuns/inputType.dart';
import 'package:digprev_flutter/domain/models/question/option.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';
part 'question.g.dart';
@freezed
class Question with _$Question{
  const factory Question({
    required String question,
    required String placeholder,
    required String supportingText,
    required String tooltipText,
    required InputType inputType,
 required List<String> explanatoryTexts,
required List<Option> options,
}) = _Question;
  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
}
List<Option> _optionsFromJson(List<dynamic>? json) =>
    json?.map((e) => Option.fromJson(e as Map<String, dynamic>)).toList() ?? [];

List<Map<String, dynamic>> _optionsToJson(List<Option> options) =>
    options.map((e) => e.toJson()).toList();

