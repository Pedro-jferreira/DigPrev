import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'users.freezed.dart';
part 'users.g.dart';

@freezed
class Users with _$Users {
  const factory Users ({
    required String id,
    required String nome,
    required String cpf,
    required String senha,
    required DateTime dataNascimento,
    required String email,
  }) = _Users;

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
}