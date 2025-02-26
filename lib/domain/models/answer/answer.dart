import 'package:digprev_flutter/domain/models/question/option.dart';
import 'package:digprev_flutter/utils/timestampConverter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer.freezed.dart';
part 'answer.g.dart';

@freezed
class Answer with _$Answer {
  const factory Answer({
    required String id,
    @TimestampConverter() required DateTime date,
    @JsonKey(toJson: _answersToJson) required List<Option> answers,
  }) = _Answer;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}

List<Map<String, dynamic>> _answersToJson(List<Option> answers) =>
    answers.map((e) => e.toJson()).toList();
