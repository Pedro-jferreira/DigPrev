import 'package:digprev_flutter/domain/models/question/option.dart';
import 'package:digprev_flutter/utils/timestampConverter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer.freezed.dart';
part 'answer.g.dart';

@freezed
class Answer with _$Answer {
  const factory Answer({
    required String id,
    required String questionRef,
    @TimestampConverter() required DateTime date,
    required List<Option> answers,
  }) = _Answer;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}

