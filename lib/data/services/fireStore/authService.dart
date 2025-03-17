import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digprev_flutter/domain/models/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:result_dart/result_dart.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final String path = 'users';
  String? _userId;

  Stream<Result<User>> get authStatesChanges =>
      _firebaseAuth.authStateChanges().map((User? user) {
        if (user == null) {
          return Failure<User, FirebaseAuthException>(
            FirebaseAuthException(
              message: 'Nenhum usuário autenticado!',
              code: 'user-not-found',
            ),
          );
        }
        return Success<User, FirebaseAuthException>(user);
      });

  String? get userId => _userId;

  AsyncResult<UserModel> findById(String id) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> document =
          await db.collection(path).doc(id).get();
      if (!document.exists || document.data() == null) {
        return Failure<UserModel, FirebaseException>(
          FirebaseException(
            plugin: 'firestore',
            message: 'Usuário não encontrado',
          ),
        );
      }

      final UserModel user = UserModel.fromJson(document.data()!);
      return Success<UserModel, FirebaseException>(user);
    } on FirebaseException catch (e) {
      return Failure<UserModel, FirebaseException>(e);
    }
  }

  AsyncResult<UserModel> cadastrarUsuario(UserModel user) async {
    try {
      final UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: user.email,
            password: user.senha,
          );
      final User? firebaseUser = result.user;
      if (firebaseUser == null) {
        return Failure<UserModel, FirebaseException>(
          FirebaseException(
            plugin: 'firebase_auth',
            message: 'Erro ao criar usuário!',
          ),
        );
      } else
        await logoutUsuario();
      user = user.copyWith(id: firebaseUser.uid);

      return await save(user);
    } on FirebaseAuthException catch (e) {
      return Failure<UserModel, FirebaseException>(e);
    }
  }

  AsyncResult<UserModel> save(UserModel user) async {
    try {
      final DocumentReference<Map<String, dynamic>> document = db
          .collection(path)
          .doc(user.id);
      await document.set(user.toJson());
      return Success<UserModel, FirebaseException>(user);
    } on FirebaseException catch (e) {
      return Failure<UserModel, FirebaseException>(e);
    }
  }

  AsyncResult<UserModel> loginUsuario(String email, String password) async {
    try {
      final UserCredential result = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      final User? firebaseUser = result.user;
      _userId = firebaseUser?.uid;
      if (firebaseUser == null) {
        return Failure<UserModel, FirebaseException>(
          FirebaseException(
            plugin: 'firebase_auth',
            message: 'Falha ao autenticar usuário!',
          ),
        );
      }
      return findById(firebaseUser.uid);
    } on FirebaseAuthException catch (e) {
      return Failure<UserModel, FirebaseAuthException>(e);
    }
  }

  Future<void> logoutUsuario() async {
    await _firebaseAuth.signOut();
  }
}
