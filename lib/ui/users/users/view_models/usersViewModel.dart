import 'package:digprev_flutter/data/repositories/userRepository/authRepository.dart';
import 'package:digprev_flutter/domain/models/user/credentialsModel.dart';
import 'package:digprev_flutter/domain/models/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

class UsersViewModel extends ChangeNotifier {
  UsersViewModel({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

  CredentialsModel? _user;
  CredentialsModel? get user => _user;
  UserModel? _userModel;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<CredentialsModel> loadCurrentUser() async {
    final User? firebaseUser = FirebaseAuth.instance.currentUser;
    var credentials;
    if (firebaseUser != null) {
      credentials = await findUserById(firebaseUser.uid);
      notifyListeners();
    }
    return credentials;
  }

  Future<CredentialsModel> findUserById(String userId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final ResultDart<UserModel, Exception> result =
    await _authRepository.findById(userId);

    CredentialsModel? credentials;

    result.fold(
          (UserModel userData) {
        _userModel = userData;

        credentials = CredentialsModel(
          nome: _userModel!.nome,
          telefone: _userModel!.telefone,
          cpf: _userModel!.cpf,
          dataNascimento: _userModel!.dataNascimento,
          email: _userModel!.email,
        );
        _user = credentials;
      },
          (Exception failure) => _error = 'deu erro',
    );

    _isLoading = false;
    notifyListeners();

    return credentials!;
  }

  Future<void> atualizarUser(CredentialsModel credentials) async{
    _isLoading = true;
    final UserModel user = UserModel (
        id: '1',
        nome: credentials.nome,
        cpf: credentials.cpf,
        senha: credentials.senha,
        email: credentials.email,
        dataNascimento: credentials.dataNascimento,
        telefone: credentials.telefone,
        consentForms: [],
        acceptedConsentForms: []
    );
    try {
      await _authRepository.atualizarUsuario(user);
      await Future.delayed(Duration(milliseconds: 500));
      _user = await loadCurrentUser();
      notifyListeners();
      _isLoading = false;
    } catch(e) {
      _error = 'Erro ao registrar';
      _isLoading = false;
      notifyListeners();
    }
  }
}