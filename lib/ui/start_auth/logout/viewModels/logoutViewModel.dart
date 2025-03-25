
import 'package:digprev_flutter/data/repositories/userRepository/authRepository.dart';
import 'package:flutter/material.dart';

class LogoutViewModel extends ChangeNotifier {
  LogoutViewModel({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

  Future<void> logout() async{
    await _authRepository.logoutUsuario();
  }
}