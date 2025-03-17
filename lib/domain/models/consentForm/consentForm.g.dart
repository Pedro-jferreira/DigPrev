// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consentForm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsentFormModelImpl _$$ConsentFormModelImplFromJson(
  Map<String, dynamic> json,
) => _$ConsentFormModelImpl(
  text: json['text'] as String,
  dataForm: const TimestampSerializer().fromJson(json['dataForm']),
  titulo: json['titulo'] as String,
);

Map<String, dynamic> _$$ConsentFormModelImplToJson(
  _$ConsentFormModelImpl instance,
) => <String, dynamic>{
  'text': instance.text,
  'dataForm': const TimestampSerializer().toJson(instance.dataForm),
  'titulo': instance.titulo,
};
