import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'users.freezed.dart';
part 'users.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel ({
    required String id,
    required String nome,
    required String cpf,
    required String senha,
    required DateTime dataNascimento,
    required String email,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}