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
  days: (json['days'] as num?)?.toInt(),
  hours: (json['hours'] as num?)?.toInt(),
  minutess: (json['minutess'] as num?)?.toInt(),
  noneOption: json['noneOption'] as bool?,
);

Map<String, dynamic> _$$OptionImplToJson(_$OptionImpl instance) =>
    <String, dynamic>{
      'counter': instance.counter,
      'text': instance.text,
      'valueScore': instance.valueScore,
      'intensity': instance.intensity,
      'days': instance.days,
      'hours': instance.hours,
      'minutess': instance.minutess,
      'noneOption': instance.noneOption,
    };
