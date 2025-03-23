import 'package:digprev_flutter/data/repositories/userRepository/authRepository.dart';
import 'package:flutter/material.dart';

class ConsentViewModel extends ChangeNotifier {
  ConsentViewModel({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

}