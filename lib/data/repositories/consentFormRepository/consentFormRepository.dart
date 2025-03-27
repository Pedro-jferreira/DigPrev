import 'package:digprev_flutter/domain/models/consentForm/consentForm.dart';
import 'package:result_dart/result_dart.dart';

abstract class ConsentFormRepository{
  AsyncResult<ConsentFormModel> save(ConsentFormModel consentForms);
  AsyncResult<ConsentFormModel> findById(String id);
  AsyncResult<List<ConsentFormModel>> fetchAll();
  Stream<List<ConsentFormModel>> observerAll();
}