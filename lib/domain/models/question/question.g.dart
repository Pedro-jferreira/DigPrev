// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionImpl _$$QuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuestionImpl(
      id: json['id'] as String,
      counter: (json['counter'] as num).toInt(),
      question: json['question'] as String,
      placeholder: json['placeholder'] as String,
      supportingText: json['supportingText'] as String,
      tooltipText: json['tooltipText'] as String,
      inputType: $enumDecode(_$InputTypeEnumMap, json['inputType']),
      explanatoryTexts:
          (json['explanatoryTexts'] as List<dynamic>?)
              ?.map((e) => ExplanatoryTexts.fromJson(e as Map<String, dynamic>))
              .toList(),
      optionsQuestions:
          (json['optionsQuestions'] as List<dynamic>)
              .map((e) => Option.fromJson(e as Map<String, dynamic>))
              .toList(),
      disableQuestions:
          (json['disableQuestions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
    );

Map<String, dynamic> _$$QuestionImplToJson(
  _$QuestionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'counter': instance.counter,
  'question': instance.question,
  'placeholder': instance.placeholder,
  'supportingText': instance.supportingText,
  'tooltipText': instance.tooltipText,
  'inputType': _$InputTypeEnumMap[instance.inputType]!,
  'explanatoryTexts':
      instance.explanatoryTexts?.map((e) => e.toJson()).toList(),
  'optionsQuestions': instance.optionsQuestions.map((e) => e.toJson()).toList(),
  'disableQuestions': instance.disableQuestions,
};

const _$InputTypeEnumMap = {
  InputType.SELECT: 'SELECT',
  InputType.RADIOBUTTON: 'RADIOBUTTON',
  InputType.NUMBERFIELD: 'NUMBERFIELD',
  InputType.SLIDER: 'SLIDER',
  InputType.SIM_NAO: 'SIM_NAO',
  InputType.FREQUENCY_TIME: 'FREQUENCY_TIME',
  InputType.CHECK_BOX_GROUP: 'CHECK_BOX_GROUP',
};
