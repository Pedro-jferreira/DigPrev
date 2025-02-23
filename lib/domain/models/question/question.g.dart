// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionImpl _$$QuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuestionImpl(
      question: json['question'] as String,
      placeholder: json['placeholder'] as String,
      supportingText: json['supportingText'] as String,
      tooltipText: json['tooltipText'] as String,
      inputType: $enumDecode(_$InputTypeEnumMap, json['inputType']),
      explanatoryTexts:
          (json['explanatoryTexts'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      options:
          (json['options'] as List<dynamic>)
              .map((e) => Option.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$QuestionImplToJson(_$QuestionImpl instance) =>
    <String, dynamic>{
      'question': instance.question,
      'placeholder': instance.placeholder,
      'supportingText': instance.supportingText,
      'tooltipText': instance.tooltipText,
      'inputType': _$InputTypeEnumMap[instance.inputType]!,
      'explanatoryTexts': instance.explanatoryTexts,
      'options': instance.options,
    };

const _$InputTypeEnumMap = {
  InputType.SELECT: 'SELECT',
  InputType.RADIO_BUTTOM: 'RADIO_BUTTOM',
  InputType.TEXT_INPUT: 'TEXT_INPUT',
  InputType.SIM_NAO: 'SIM_NAO',
  InputType.DATE: 'DATE',
  InputType.NUMBER_INPUT: 'NUMBER_INPUT',
};
