import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digprev_flutter/domain/models/responseCard/responseCard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:result_dart/result_dart.dart';

class ResponseCardService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final String path = 'response_cards';

  AsyncResult<ResponseCard> save(ResponseCard responseCard) async {
    try {
      final DocumentReference<Map<String, dynamic>> document = db
          .collection(path)
          .doc(responseCard.id);

      await document.set(
        responseCard.toJson(),
      );
      return Success<ResponseCard, Exception>(responseCard);
    } catch (e) {
      return Failure<ResponseCard, Exception>(Exception(e.toString()));
    }
  }

  AsyncResult<ResponseCard> update(String id, ResponseCard responseCard) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await db.collection(path).where('id', isEqualTo: id).limit(1).get();

      if (querySnapshot.docs.isEmpty) {
        return Failure<ResponseCard, Exception>(
          Exception('Documento não encontrado'),
        );
      }

      final DocumentReference<Map<String, dynamic>> document =
          querySnapshot.docs.first.reference;
      await document.set(responseCard.toJson(), SetOptions(merge: true));
      return Success<ResponseCard, Exception>(responseCard);
    } catch (e) {
      return Failure<ResponseCard, Exception>(Exception(e.toString()));
    }
  }

  AsyncResult<ResponseCard> findById(String id) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await db.collection(path).where('id', isEqualTo: id).limit(1).get();

      if (querySnapshot.docs.isEmpty) {
        return Failure<ResponseCard, Exception>(
          Exception('Documento não encontrado'),
        );
      }

      final ResponseCard responseCard = ResponseCard.fromJson(
        querySnapshot.docs.first.data(),
      );
      return Success<ResponseCard, Exception>(responseCard);
    } catch (e) {
      return Failure<ResponseCard, Exception>(Exception(e.toString()));
    }
  }

  Stream<Result<ResponseCard>> observerById(String id) {
    return db
        .collection(path)
        .where('id', isEqualTo: id)
        .limit(1)
        .snapshots()
        .map((QuerySnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.docs.isEmpty) {
            return Failure<ResponseCard, Exception>(
              Exception('Documento não encontrado'),
            );
          }
          return Success<ResponseCard, Exception>(
            ResponseCard.fromJson(snapshot.docs.first.data()),
          );
        })
        .handleError((Object error) {
          return Failure<ResponseCard, Exception>(Exception(error.toString()));
        });
  }

  Stream<Result<ResponseCard>> observerPending() {
    return db
        .collection(path)
        .where('isCompleted', isEqualTo: false)
        .limit(1)
        .snapshots()
        .map((QuerySnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.docs.isEmpty) {
            return Failure<ResponseCard, Exception>(
              Exception('Documento não encontrado'),
            );
          }
          return Success<ResponseCard, Exception>(
            ResponseCard.fromJson(snapshot.docs.first.data()),
          );
        })
        .handleError((Object error) {
          return Failure<ResponseCard, Exception>(Exception(error.toString()));
        });
  }

  Stream<List<ResponseCard>> observerAll() {
    return db
        .collection(path)
        .snapshots()
        .map((QuerySnapshot<Map<String, dynamic>> snapshot) {
          return snapshot.docs
              .map(
                (QueryDocumentSnapshot<Map<String, dynamic>> doc) =>
                ResponseCard.fromJson(doc.data()),
          )
              .toList();
        })
        .handleError((Object error) {
          return <ResponseCard>[];
        });
  }

  Stream<List<ResponseCard>> observerAllCompleted() {
    return db
        .collection(path)
        .where('isCompleted', isEqualTo: true)
        .snapshots()
        .map((QuerySnapshot<Map<String, dynamic>> snapshot) {
          return snapshot.docs
              .map(
                (QueryDocumentSnapshot<Map<String, dynamic>> doc) =>
                ResponseCard.fromJson(doc.data()),
          )
              .toList();
        })
        .handleError((Object error) => <ResponseCard>[]);
  }
}
