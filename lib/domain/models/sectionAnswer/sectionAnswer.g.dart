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
      answers:
          (json['answers'] as List<dynamic>)
              .map((e) => Answer.fromJson(e as Map<String, dynamic>))
              .toList(),
      score: (json['score'] as num).toDouble(),
      isCalculated: json['isCalculated'] as bool,
    );

Map<String, dynamic> _$$SectionAnswerImplToJson(_$SectionAnswerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'sectionRef': instance.sectionRef,
      'answers': _answersToJson(instance.answers),
      'score': instance.score,
      'isCalculated': instance.isCalculated,
    };
