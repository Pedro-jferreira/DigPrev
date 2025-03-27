import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digprev_flutter/domain/models/consentForm/consentForm.dart';
import 'package:result_dart/result_dart.dart';

class ConsentFormService {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final String path = 'consentForms';

  AsyncResult<ConsentFormModel> findById(String id) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> document =
          await db.collection(path).doc(id).get();
      if (!document.exists || document.data() == null) {
        return Failure<ConsentFormModel, FirebaseException>(
          FirebaseException(
            plugin: 'firestore',
            message: 'Formulário de Consentimento não encontrado',
          ),
        );
      }

      final ConsentFormModel consentForm = ConsentFormModel.fromJson(
        document.data()!,
      );
      return Success<ConsentFormModel, FirebaseException>(consentForm);
    } on FirebaseException catch (e) {
      return Failure<ConsentFormModel, FirebaseException>(e);
    }
  }

  AsyncResult<List<ConsentFormModel>> fetchAll() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await db.collection(path).get();

      final List<ConsentFormModel> consentForms =
          snapshot.docs.map((QueryDocumentSnapshot<Map<String, dynamic>> doc) {
            return ConsentFormModel.fromJson(doc.data());
          }).toList();

      return Success<List<ConsentFormModel>, Exception>(consentForms);
    } catch (e) {
      return Failure<List<ConsentFormModel>, Exception>(
        Exception(e.toString()),
      );
    }
  }

  Stream<List<ConsentFormModel>> observerAll() {
    return db.collection(path).snapshots().map((
      QuerySnapshot<Map<String, dynamic>> snapshot,
    ) {
      return snapshot.docs.map((
        QueryDocumentSnapshot<Map<String, dynamic>> doc,
      ) {
        final Map<String, dynamic> data = doc.data();
        return ConsentFormModel.fromJson(data);
      }).toList();
    });
  }

  AsyncResult<ConsentFormModel> save(ConsentFormModel consentForms) async {
    try {
      final DocumentReference<Map<String, dynamic>> document =
          db.collection(path).doc();
      final ConsentFormModel consentFormUpdate = consentForms.copyWith(
        id: document.id,
      );
      await document.set(consentFormUpdate.toJson());
      return Success<ConsentFormModel, FirebaseException>(consentFormUpdate);
    } on FirebaseException catch (e) {
      return Failure<ConsentFormModel, FirebaseException>(e);
    }
  }
}
