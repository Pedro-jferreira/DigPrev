// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      nome: json['nome'] as String,
      cpf: json['cpf'] as String,
      senha: json['senha'] as String,
      dataNascimento: const TimestampSerializer().fromJson(
        json['dataNascimento'],
      ),
      email: json['email'] as String,
      telefone: json['telefone'] as String,
      consentForms:
          (json['consentForms'] as List<dynamic>?)
              ?.map((e) => ConsentFormModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      acceptedConsentForms:
          (json['acceptedConsentForms'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
    );

Map<String, dynamic> _$$UserModelImplToJson(
  _$UserModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'nome': instance.nome,
  'cpf': instance.cpf,
  'senha': instance.senha,
  'dataNascimento': const TimestampSerializer().toJson(instance.dataNascimento),
  'email': instance.email,
  'telefone': instance.telefone,
  'consentForms': instance.consentForms?.map((e) => e.toJson()).toList(),
  'acceptedConsentForms': instance.acceptedConsentForms,
};
