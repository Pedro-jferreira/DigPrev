import 'package:digprev_flutter/domain/models/enums/typeCalculate.dart';
import 'package:digprev_flutter/domain/models/question/question.dart';
import 'package:digprev_flutter/domain/models/section/stageLabel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'section.freezed.dart';

part 'section.g.dart';

@freezed
class Section with _$Section {
  const factory Section({
    required double id,
    required String title,
    required double maxValue,
    required TypeCalculate typeCalculate,
    required List<StageLabel>? textUnderBar,
    required List<Question> questions,
    required List<Section>? subSections,
    required bool hasChart,
  }) = _Section;

  factory Section.fromJson(Map<String, dynamic> json) =>
      _$SectionFromJson(json);
}
