// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsersImpl _$$UsersImplFromJson(Map<String, dynamic> json) => _$UsersImpl(
  id: json['id'] as String,
  nome: json['nome'] as String,
  cpf: json['cpf'] as String,
  senha: json['senha'] as String,
  dataNascimento: DateTime.parse(json['dataNascimento'] as String),
  email: json['email'] as String,
);

Map<String, dynamic> _$$UsersImplToJson(_$UsersImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'cpf': instance.cpf,
      'senha': instance.senha,
      'dataNascimento': instance.dataNascimento.toIso8601String(),
      'email': instance.email,
    };
