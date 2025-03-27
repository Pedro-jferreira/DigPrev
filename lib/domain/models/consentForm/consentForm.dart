import 'package:digprev_flutter/utils/timestampConverter.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:digprev_flutter/domain/models/enums/statusConsentForm.dart';

part 'consentForm.freezed.dart';
part 'consentForm.g.dart';

@freezed
class ConsentFormModel with _$ConsentFormModel{

  const factory ConsentFormModel({
    required String id,
    required String text,
    @TimestampSerializer() required DateTime dataForm,
    required String titulo,
    required StatusConsentForm status
  }) = _ConsentFormModel;

  factory ConsentFormModel.fromJson(Map<String, dynamic> json) =>
      _$ConsentFormModelFromJson(json);
}