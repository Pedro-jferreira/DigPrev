// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SectionImpl _$$SectionImplFromJson(Map<String, dynamic> json) =>
    _$SectionImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      maxValue: (json['maxValue'] as num?)?.toInt(),
      typeCalculate: $enumDecode(_$TypeCalculateEnumMap, json['typeCalculate']),
      textUnderBar:
          (json['textUnderBar'] as List<dynamic>?)
              ?.map((e) => StageLabel.fromJson(e as Map<String, dynamic>))
              .toList(),
      questions:
          (json['questions'] as List<dynamic>?)
              ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$SectionImplToJson(_$SectionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'maxValue': instance.maxValue,
      'typeCalculate': _$TypeCalculateEnumMap[instance.typeCalculate]!,
      'textUnderBar': instance.textUnderBar?.map((e) => e.toJson()).toList(),
      'questions': instance.questions?.map((e) => e.toJson()).toList(),
    };

const _$TypeCalculateEnumMap = {
  TypeCalculate.PONTUACAO: 'PONTUACAO',
  TypeCalculate.ATIVIDADE_FISICA: 'ATIVIDADE_FISICA',
  TypeCalculate.SEM_CALCULO: 'SEM_CALCULO',
};
