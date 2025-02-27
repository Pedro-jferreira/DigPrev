import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request.freezed.dart';
part 'login_request.g.dart';

@freezed
class Login_Request with _$Login_Request{
  const factory Login_Request({
    required String email,
    required String password
  }) = _Login_Request;

  factory Login_Request.fromJson(Map<String, dynamic> json) =>
      _$Login_RequestFromJson(json);
}