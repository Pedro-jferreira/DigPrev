import 'package:digprev_flutter/data/repositories/userRepository/authRepository.dart';
import 'package:digprev_flutter/domain/models/user/user.dart';
import 'package:digprev_flutter/domain/models/user/credentialsModel.dart';
import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;
  bool _isLoading = false;
  String? _errorMessage;

  Future<Result<void>> login((String, String) credentials) async {
    final (String email, String password) = credentials;
    final ResultDart<UserModel, Exception> result = await
      _authRepository.loginUsuario(
        email,
        password
    );
    if (result.isError()){
      print('login não sucedido');
    }
    return result;
  }

  Future<void> cadastrar(CredentialsModel credentials) async{
    _isLoading = true;
    notifyListeners();

    final UserModel user = UserModel (
      id: '1',
      nome: credentials.nome,
      cpf: credentials.cpf,
      senha: credentials.senha,
      email: credentials.email,
      dataNascimento: credentials.dataNascimento
    );

    try {
      await _authRepository.cadastrarUsuario(user);
      _isLoading = false;
      notifyListeners();
    } catch(e) {
      _errorMessage = 'Erro ao registrar';
      _isLoading = false;
      notifyListeners();
    }
  }
}