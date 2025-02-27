import 'package:digprev_flutter/domain/models/sectionAnswer/sectionAnswer.dart';
import 'package:digprev_flutter/utils/timestampConverter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'responseCard.freezed.dart';
part 'responseCard.g.dart';

@freezed
class ResponseCard with _$ResponseCard {
  const factory ResponseCard({
    required String id,
    required String? userRef,
    @TimestampConverter() required DateTime date,
   required List<SectionAnswer> sections,
    required bool isCalculated,
    required bool isCompleted,
  }) = _ResponseCard;

  factory ResponseCard.fromJson(Map<String, dynamic> json) =>
      _$ResponseCardFromJson(json);
}