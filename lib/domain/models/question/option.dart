import 'package:freezed_annotation/freezed_annotation.dart';

part 'option.freezed.dart';
part 'option.g.dart';

@freezed
class Option with _$Option {
  const factory Option({
    required int counter,
    required String? text,
    required double? valueScore,
    required String? intensity,
    required int? days,
    required int? hours,
    required int? minutess,
    required bool? noneOption
  }) = _Option;

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
}