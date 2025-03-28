import 'dart:async';

import 'package:digprev_flutter/data/repositories/responseCardRepository/responseCardRepository.dart';
import 'package:digprev_flutter/data/repositories/userRepository/authRepository.dart';
import 'package:digprev_flutter/domain/models/responseCard/responseCard.dart';
import 'package:digprev_flutter/domain/models/user/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:result_dart/result_dart.dart';

class ReportPdfViewModel extends ChangeNotifier {
  ReportPdfViewModel({
    required ResponseCardRepository responseCardRepository,
    required AuthRepository authRepository,
  }) : _responseCardRepository = responseCardRepository,
       _authRepository = authRepository;

  final ResponseCardRepository _responseCardRepository;
  final AuthRepository _authRepository;

  AsyncResult<(ResponseCard, UserModel)> findData(String responseCardId)async {
    try {
      return _responseCardRepository.findById(responseCardId).flatMap((responseCard) {
        return _authRepository.findById(responseCard.userRef).map((userModel) {
          return (responseCard, userModel);
        });
      });
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

}
