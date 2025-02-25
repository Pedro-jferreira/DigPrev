import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digprev_flutter/domain/models/stage/stage.dart';
import 'package:digprev_flutter/utils/result.dart';

class StageService {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final String path = 'questionarios';

  Future<Result<Stage>> findById(int id) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await db.collection(path).where('id', isEqualTo: id).limit(1).get();

      if (querySnapshot.docs.isEmpty) {
        return Result.error(Exception('Documento não encontrado'));
      }

      final Stage stage = Stage.fromJson(querySnapshot.docs.first.data());
      return Result.ok(stage);
    } catch (e) {
      return Result.error(Exception('Error ao buscar o documento: $e'));
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
