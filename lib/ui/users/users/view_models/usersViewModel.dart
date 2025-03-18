
import 'package:digprev_flutter/data/repositories/userRepository/authRepository.dart';
import 'package:digprev_flutter/domain/models/user/user.dart';
import 'package:flutter/material.dart';

class UsersViewModel extends ChangeNotifier {
  UsersViewModel({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

  UserModel? _user;
  UserModel? get user => _user;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> findUserById(String userId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await _authRepository.findById(userId);

    result.fold(
          (userData) => _user = userData,
          (failure) => _error = "deu erro"
    );

    print('<<< foi?>>>> ${_user}');
    _isLoading = false;
    notifyListeners();
  }
}