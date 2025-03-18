import 'package:digprev_flutter/data/repositories/userRepository/authRepository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:result_dart/src/types.dart';

class AuthNotifier extends ChangeNotifier{
  final AuthRepository authRepository;
  User? user;

  AuthNotifier({required this.authRepository}) {
    _listenAuthChanges();
  }

  void _listenAuthChanges() {
    authRepository.authStatesChanges.listen((Result<User> result) {
      result.fold(
          (User onSuccess) {
            user = onSuccess;
          },
          (Exception onFailure) {
            user = null;
          },
      );
      notifyListeners();
    });
  }

  bool get isAuthenticated => user != null;
}