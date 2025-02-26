import 'package:digprev_flutter/data/repositories/userRepository/authRepository.dart';
import 'package:digprev_flutter/data/services/fireStore/authService.dart';
import 'package:digprev_flutter/domain/models/users/users.dart';
import 'package:digprev_flutter/utils/result.dart';

class AuthRepositoryRemote implements AuthRepository {
  AuthRepositoryRemote({required AuthService authService})
      : _authService = authService;

  final AuthService _authService;

  @override
  Future<Result<UserModel>> findById(String id) async {
    return await _authService.findById(id);
  }

  @override
  Future<Result<UserModel>> cadastrarUsuario(String email, String password, UserModel user) {
    return _authService.cadastrarUsuario(email, password, user);
  }

  @override
  Future<Result<UserModel>> loginUsuario(String email, String password) {
    return _authService.loginUsuario(email, password);
  }

  @override
  Future<void> logoutUsuario() {
    return _authService.logoutUsuario();
  }
}