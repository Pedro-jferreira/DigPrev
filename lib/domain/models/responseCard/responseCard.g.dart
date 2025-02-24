// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responseCard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResponseCardImpl _$$ResponseCardImplFromJson(Map<String, dynamic> json) =>
    _$ResponseCardImpl(
      id: json['id'] as String,
      userRef: json['userRef'] as String,
      date: DateTime.parse(json['date'] as String),
      sectionAnswer:
          (json['sectionAnswer'] as List<dynamic>)
              .map((e) => SectionAnswer.fromJson(e as Map<String, dynamic>))
              .toList(),
      isCalculated: json['isCalculated'] as bool,
      isCompleted: json['isCompleted'] as bool,
    );

Map<String, dynamic> _$$ResponseCardImplToJson(_$ResponseCardImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userRef': instance.userRef,
      'date': instance.date.toIso8601String(),
      'sectionAnswer': instance.sectionAnswer,
      'isCalculated': instance.isCalculated,
      'isCompleted': instance.isCompleted,
    };
