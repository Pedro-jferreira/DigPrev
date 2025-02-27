import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digprev_flutter/domain/models/stage/stage.dart';
import 'package:result_dart/result_dart.dart';

class StageService {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final String path = 'questionarios';

  AsyncResult<Stage> findById(int id) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await db.collection(path).where('id', isEqualTo: id).limit(1).get();

      if (querySnapshot.docs.isEmpty) {
        return Failure(Exception('Documento não encontrado'));
      }

      final Stage stage = Stage.fromJson(querySnapshot.docs.first.data());
      return Success(stage);
    } catch (e) {
      return Failure(Exception(e.toString()));
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
}
