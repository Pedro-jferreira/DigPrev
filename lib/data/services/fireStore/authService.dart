import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digprev_flutter/domain/models/users/users.dart';
import 'package:digprev_flutter/utils/result.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final String path = 'users';

  Stream<User?> get authStatesChanges => _firebaseAuth.authStateChanges();

  Future<Result<UserModel>> findById(String id) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await db.collection(path).where('id', isEqualTo: id).limit(1).get();

      if (querySnapshot.docs.isEmpty) {
        return Result<UserModel>.error(Exception('Documento não encontrado'));
      }

      final UserModel user = UserModel.fromJson(querySnapshot.docs.first.data());
      return Result<UserModel>.ok(user);
    } catch (e) {
      return Result<UserModel>.error(Exception('Error ao buscar o documento: $e'));
    }
  }

  Future<Result<UserModel>> cadastrarUsuario(
    String email,
    String password,
    UserModel user,
  ) async {
    try {
      final UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      final User? firebaseUser = result.user;
      if (firebaseUser == null) {
        return Result<UserModel>.error(Exception('Erro ao criar usuário!'));
      }
      final UserModel novoUsuario = user.copyWith(id: firebaseUser.uid);
      var doc = db.collection(path).doc();
      doc.set(novoUsuario.toJson());
      return Result<UserModel>.ok(novoUsuario);
    } on FirebaseAuthException catch (e) {
      return Result<UserModel>.error(e);
    }
  }

  Future<Result<UserModel>> loginUsuario(
    String email,
    String password,
  ) async {
    logoutUsuario();
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? firebaseUser = result.user;
      if (firebaseUser == null) {
        return Result<UserModel>.error(Exception('Erro ao criar usuário!'));
      }
      final UserModel usuarioEntity = findById(firebaseUser.uid) as UserModel;
      if(usuarioEntity.email == email){
        return Result<UserModel>.ok(usuarioEntity);
      }
      return Result<UserModel>.ok(usuarioEntity);;
    } on FirebaseAuthException catch (e) {
      return Result<UserModel>.error(e);
    }
  }

  Future<void> logoutUsuario() async {_firebaseAuth.signOut();}
}
