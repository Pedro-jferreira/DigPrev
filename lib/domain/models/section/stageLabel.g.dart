// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stageLabel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StageLabelImpl _$$StageLabelImplFromJson(Map<String, dynamic> json) =>
    _$StageLabelImpl(
      min: (json['min'] as num).toInt(),
      max: (json['max'] as num).toInt(),
      label: json['label'] as String,
    );

Map<String, dynamic> _$$StageLabelImplToJson(_$StageLabelImpl instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
      'label': instance.label,
    };
