// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnswerImpl _$$AnswerImplFromJson(Map<String, dynamic> json) => _$AnswerImpl(
  id: json['id'] as String,
  questionRef: json['questionRef'] as String,
  date: DateTime.parse(json['date'] as String),
  answers:
      (json['answers'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$AnswerImplToJson(_$AnswerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'questionRef': instance.questionRef,
      'date': instance.date.toIso8601String(),
      'answers': _answersToJson(instance.answers),
    };
