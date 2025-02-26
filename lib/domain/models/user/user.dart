import 'package:digprev_flutter/utils/timestampConverter.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel ({
    required String? id,
    required String nome,
    required String cpf,
    required String senha,
    @TimestampConverter() required DateTime dataNascimento,
    required String email,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}