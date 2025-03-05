import 'dart:async';
import 'package:flutter/cupertino.dart';

class StartViewModel extends ChangeNotifier {
  bool _shouldNavigate = false;

  bool get shouldNavigate => _shouldNavigate;

  StartViewModel() {
    Future.delayed(const Duration(seconds: 3), () {
      _shouldNavigate = true;
      notifyListeners();
    });
  }
}