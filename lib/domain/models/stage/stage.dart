import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digprev_flutter/domain/models/section/section.dart';
import 'package:digprev_flutter/utils/timeStampConversor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stage.freezed.dart';
part 'stage.g.dart';

@freezed
class Stage with _$Stage {
  const factory Stage({
    required int id,
    required String title,
    required String description,
    @TimestampConverter() required DateTime creationDate,
    required List<Section>? sections,
  }) = _Stage;

  factory Stage.fromJson(Map<String, dynamic> json) => _$StageFromJson(json);
}
