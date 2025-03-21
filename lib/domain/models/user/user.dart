import 'package:digprev_flutter/utils/timestampConverter.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:digprev_flutter/domain/models/consentForm/consentForm.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String nome,
    required String cpf,
    required String senha,
    @TimestampSerializer() required DateTime dataNascimento,
    required String email,
    required String telefone,
    List<ConsentFormModel>? consentForms,
    List<String>? acceptedConsentForms
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
// criar classe/documento termos de consentimento com data, body e titulo
// aqui criar a lista de termos, os checks dos termos e telefone