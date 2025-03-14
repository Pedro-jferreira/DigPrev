// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OptionImpl _$$OptionImplFromJson(Map<String, dynamic> json) => _$OptionImpl(
  counter: (json['counter'] as num).toInt(),
  text: json['text'] as String?,
  valueScore: (json['valueScore'] as num?)?.toDouble(),
  intensity: json['intensity'] as String?,
);

Map<String, dynamic> _$$OptionImplToJson(_$OptionImpl instance) =>
    <String, dynamic>{
      'counter': instance.counter,
      'text': instance.text,
      'valueScore': instance.valueScore,
      'intensity': instance.intensity,
    };
