// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sectionAnswer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SectionAnswerImpl _$$SectionAnswerImplFromJson(Map<String, dynamic> json) =>
    _$SectionAnswerImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      sectionRef: (json['sectionRef'] as num).toDouble(),
      answers:
          (json['answers'] as List<dynamic>)
              .map((e) => Answer.fromJson(e as Map<String, dynamic>))
              .toList(),
      subSectionsAnswers:
          (json['subSectionsAnswers'] as List<dynamic>?)
              ?.map((e) => SectionAnswer.fromJson(e as Map<String, dynamic>))
              .toList(),
      score: (json['score'] as num).toDouble(),
      isCalculated: json['isCalculated'] as bool,
      hasChart: json['hasChart'] as bool,
    );

Map<String, dynamic> _$$SectionAnswerImplToJson(_$SectionAnswerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'sectionRef': instance.sectionRef,
      'answers': instance.answers.map((e) => e.toJson()).toList(),
      'subSectionsAnswers':
          instance.subSectionsAnswers?.map((e) => e.toJson()).toList(),
      'score': instance.score,
      'isCalculated': instance.isCalculated,
      'hasChart': instance.hasChart,
    };
