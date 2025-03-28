import 'package:digprev_flutter/domain/models/answer/answer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sectionAnswer.freezed.dart';
part 'sectionAnswer.g.dart';

@freezed
class SectionAnswer with _$SectionAnswer {
  const factory SectionAnswer({
    required String id,
    required String title,
    required double sectionRef,
    required List<Answer> answers,
    required List<SectionAnswer>? subSectionsAnswers,
    required double score,
    required bool isCalculated,
    required bool hasChart,
  }) = _SectionAnswer;

  factory SectionAnswer.fromJson(Map<String, dynamic> json) =>
      _$SectionAnswerFromJson(json);
}