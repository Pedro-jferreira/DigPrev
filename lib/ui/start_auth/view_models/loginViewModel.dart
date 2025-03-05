import 'package:digprev_flutter/data/repositories/userRepository/authRepository.dart';
import 'package:digprev_flutter/domain/models/user/user.dart';
import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;
  LoginViewModel({required AuthRepository authRepository})
    : _authRepository = authRepository;
  bool _isLoading = false;
  String? _errorMessage;

  Future<Result<void>> _login((String, String) credentials) async {
    final (email, password) = credentials;
    final result = await _authRepository.loginUsuario(
      email,
      password
    );
    if (result.isError()){
      print('login não sucedido');
    }
    return result;
  }

  Future<void> _cadastrar(UserModel user) async{
    _isLoading = true;
    notifyListeners();

    try {
      var result = await _authRepository.cadastrarUsuario(user);
      print("o retorno" + result.toString());
      _isLoading = false;
      notifyListeners();
    } catch(e) {
      _errorMessage = 'Erro ao registrar';
      _isLoading = false;
      notifyListeners();
    }
  }
}