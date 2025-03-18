import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digprev_flutter/domain/models/stage/stage.dart';
import 'package:result_dart/result_dart.dart';

class StageService {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final String path = 'questionario_backup';

  AsyncResult<Stage> findById(int id) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await db.collection(path).where('id', isEqualTo: id).limit(1).get();

      if (querySnapshot.docs.isEmpty) {
        return Failure<Stage, Exception>(Exception('Documento não encontrado'));
      }

      final Stage stage = Stage.fromJson(querySnapshot.docs.first.data());
      return Success<Stage, Exception>(stage);
    } catch (e) {
      return Failure<Stage, Exception>(Exception(e.toString()));
    }
  }

  AsyncResult<List<Stage>> fetchAll() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await db.collection(path).get();

      final List<Stage> stages =
          snapshot.docs.map((QueryDocumentSnapshot<Map<String, dynamic>> doc) {
            return Stage.fromJson(doc.data());
          }).toList();

      return Success<List<Stage>, Exception>(stages);
    } catch (e) {
      return Failure<List<Stage>, Exception>(Exception(e.toString()));
    }
  }

  Stream<List<Stage>> observerAll() {
    return db.collection(path).snapshots().map((
      QuerySnapshot<Map<String, dynamic>> snapshot,
    ) {
      return snapshot.docs.map((
        QueryDocumentSnapshot<Map<String, dynamic>> doc,
      ) {
        final Map<String, dynamic> data = doc.data();
        return Stage.fromJson(data);
      }).toList();
    });
  }

  AsyncResult<Stage> update(int id, Stage stage) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await db.collection(path).where('id', isEqualTo: id).limit(1).get();

      if (querySnapshot.docs.isEmpty) {
        return Failure<Stage, Exception>(Exception('Documento não encontrado'));
      }

      final DocumentReference<Map<String, dynamic>> document =
          querySnapshot.docs.first.reference;
      await document.set(stage.toJson(), SetOptions(merge: true));
      return Success<Stage, Exception>(stage);
    } catch (e) {
      return Failure<Stage, Exception>(Exception(e.toString()));
    }
  }
}
