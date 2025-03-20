import 'package:digprev_flutter/data/repositories/userRepository/authRepository.dart';
import 'package:digprev_flutter/data/services/fireStore/authService.dart';
import 'package:digprev_flutter/domain/models/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:result_dart/result_dart.dart';

class AuthRepositoryRemote implements AuthRepository {
  AuthRepositoryRemote({required AuthService authService})
      : _authService = authService;

  final AuthService _authService;

  @override
  AsyncResult<UserModel> findById(String id) async {
    return await _authService.findById(id);
  }

  @override
  AsyncResult<UserModel> cadastrarUsuario(UserModel user) {
    return _authService.cadastrarUsuario(user);
  }

  @override
  AsyncResult<UserModel> loginUsuario(String email, String password) {
    return _authService.loginUsuario(email, password);
  }

  @override
  Future<void> logoutUsuario() {
    return _authService.logoutUsuario();
  }

  @override
  Stream<Result<User>> get authStatesChanges => _authService.authStatesChanges;

  @override
  Future<void> atualizarUsuario(UserModel user) {
    return _authService.updateUser(user);
  }
}