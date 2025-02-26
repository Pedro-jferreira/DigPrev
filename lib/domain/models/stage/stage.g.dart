// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StageImpl _$$StageImplFromJson(Map<String, dynamic> json) => _$StageImpl(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String,
  creationDate: DateTime.parse(json['creationDate'] as String),
  sections:
      (json['sections'] as List<dynamic>?)
          ?.map((e) => Section.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$StageImplToJson(_$StageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'creationDate': instance.creationDate.toIso8601String(),
      'sections': instance.sections,
    };
