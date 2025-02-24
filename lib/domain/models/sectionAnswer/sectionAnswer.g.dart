// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sectionAnswer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SectionAnswerImpl _$$SectionAnswerImplFromJson(Map<String, dynamic> json) =>
    _$SectionAnswerImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      sectionRef: json['sectionRef'] as String,
      date: DateTime.parse(json['date'] as String),
      score: (json['score'] as num).toDouble(),
      answers:
          (json['answers'] as List<dynamic>)
              .map((e) => Answer.fromJson(e as Map<String, dynamic>))
              .toList(),
      isCalculated: json['isCalculated'] as bool,
    );

Map<String, dynamic> _$$SectionAnswerImplToJson(_$SectionAnswerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'sectionRef': instance.sectionRef,
      'date': instance.date.toIso8601String(),
      'score': instance.score,
      'answers': instance.answers,
      'isCalculated': instance.isCalculated,
    };
