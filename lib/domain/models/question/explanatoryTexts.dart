import 'package:freezed_annotation/freezed_annotation.dart';

part 'explanatoryTexts.freezed.dart';
part 'explanatoryTexts.g.dart';

@freezed
class ExplanatoryTexts with _$ExplanatoryTexts {
  const factory ExplanatoryTexts({
    String? explanatoryText,
  }) = _ExplanatoryTexts;

  factory ExplanatoryTexts.fromJson(Map<String, dynamic> json) => _$ExplanatoryTextsFromJson(json);
}