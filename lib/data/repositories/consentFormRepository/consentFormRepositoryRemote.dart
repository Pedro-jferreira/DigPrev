

import 'package:digprev_flutter/data/repositories/consentFormRepository/consentFormRepository.dart';
import 'package:digprev_flutter/data/services/fireStore/consentFormService.dart';
import 'package:digprev_flutter/domain/models/consentForm/consentForm.dart';
import 'package:result_dart/src/types.dart';

class ConsentFormRepositoryRemote implements ConsentFormRepository{
  ConsentFormRepositoryRemote({required ConsentFormService consentFormService}):
      _consentFormService = consentFormService;
  final ConsentFormService _consentFormService;

  @override
  AsyncResult<ConsentFormModel> save(ConsentFormModel consentForms) {
    return _consentFormService.save(consentForms);
  }

  @override
  AsyncResult<List<ConsentFormModel>> fetchAll() {
    return _consentFormService.fetchAll();
  }

  @override
  AsyncResult<ConsentFormModel> findById(String id) {
    return _consentFormService.findById(id);
  }

  @override
  Stream<List<ConsentFormModel>> observerAll() {
    return _consentFormService.observerAll();
  }
}