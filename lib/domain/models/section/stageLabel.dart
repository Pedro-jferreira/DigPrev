import 'package:freezed_annotation/freezed_annotation.dart';

part 'stageLabel.freezed.dart';
part 'stageLabel.g.dart';

@freezed
class StageLabel with _$StageLabel{
  const factory StageLabel({
    required int min,
    required int max,
    required String label,
}) = _StageLabel;
  factory StageLabel
      .fromJson(Map<String, dynamic> json) => _$StageLabelFromJson(json);
}