import 'package:digprev_flutter/data/repositories/consentFormRepository/consentFormRepository.dart';
import 'package:flutter/material.dart';

class ConsentViewModel extends ChangeNotifier {
  ConsentViewModel({required ConsentFormRepository consentFormRepository})
      : _consentFormRepository = consentFormRepository;
  final ConsentFormRepository _consentFormRepository;

}