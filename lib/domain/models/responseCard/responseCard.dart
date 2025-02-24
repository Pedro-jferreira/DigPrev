import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digprev_flutter/domain/models/sectionAnswer/sectionAnswer.dart';
import 'package:digprev_flutter/utils/timeStampConversor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'responseCard.freezed.dart';
part 'responseCard.g.dart';

@freezed
class ResponseCard with _$ResponseCard {
  const factory ResponseCard({
    required String id,
    required String userRef,
    @TimestampConverter() required DateTime date,
    required List<SectionAnswer> sectionAnswer,
    required bool isCalculated,
    required bool isCompleted,
  }) = _ResponseCard;

  factory ResponseCard.fromJson(Map<String, dynamic> json) =>
      _$ResponseCardFromJson(json);
}
