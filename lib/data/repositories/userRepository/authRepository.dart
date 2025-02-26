import 'package:digprev_flutter/domain/models/users/users.dart';
import 'package:digprev_flutter/utils/result.dart';

abstract class AuthRepository {
  Future<Result<UserModel>> findById(String id);
  Future<Result<UserModel>> cadastrarUsuario(String email,
      String password, UserModel user);
  Future<Result<UserModel>> loginUsuario(String email,
      String password);
  Future<void> logoutUsuario();
}