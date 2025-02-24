// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OptionImpl _$$OptionImplFromJson(Map<String, dynamic> json) => _$OptionImpl(
  id: (json['id'] as num?)?.toInt(),
  question: json['question'] as String?,
  valueScore: (json['valueScore'] as num?)?.toDouble(),
  intensity: json['intensity'] as String?,
  days: (json['days'] as num?)?.toInt(),
);

Map<String, dynamic> _$$OptionImplToJson(_$OptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'valueScore': instance.valueScore,
      'intensity': instance.intensity,
      'days': instance.days,
    };
