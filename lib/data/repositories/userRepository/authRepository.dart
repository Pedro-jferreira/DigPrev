import 'package:digprev_flutter/domain/models/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:result_dart/result_dart.dart';

abstract class AuthRepository {
  AsyncResult<UserModel> findById(String id);

  AsyncResult<UserModel> cadastrarUsuario(UserModel user);

  Future<void> atualizarUsuario(UserModel user);

  AsyncResult<UserModel> loginUsuario(String email, String password);

  Stream<Result<User>> get authStatesChanges;

  Future<void> logoutUsuario();
}
