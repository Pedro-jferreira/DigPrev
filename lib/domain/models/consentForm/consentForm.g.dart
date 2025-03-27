// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consentForm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsentFormModelImpl _$$ConsentFormModelImplFromJson(
  Map<String, dynamic> json,
) => _$ConsentFormModelImpl(
  id: json['id'] as String,
  text: json['text'] as String,
  dataForm: const TimestampSerializer().fromJson(json['dataForm']),
  titulo: json['titulo'] as String,
  status: $enumDecode(_$StatusConsentFormEnumMap, json['status']),
);

Map<String, dynamic> _$$ConsentFormModelImplToJson(
  _$ConsentFormModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'text': instance.text,
  'dataForm': const TimestampSerializer().toJson(instance.dataForm),
  'titulo': instance.titulo,
  'status': _$StatusConsentFormEnumMap[instance.status]!,
};

const _$StatusConsentFormEnumMap = {
  StatusConsentForm.ATIVO: 'ATIVO',
  StatusConsentForm.DESATIVADO: 'DESATIVADO',
};
