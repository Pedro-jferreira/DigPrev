import 'package:flutter/cupertino.dart';

class CredentialsModel extends ChangeNotifier{
  String nome;
  String email;
  String cpf;
  String senha;

  CredentialsModel({
    this.nome = '',
    this.email = '',
    this.cpf = '',
    this.senha = ''
  });

  void setNome(String nome){
    this.nome = nome;
    notifyListeners();
  }

  void setEmail(String email){
    this.email = email;
    notifyListeners();
  }

  void setCpf(String cpf){
    this.cpf = cpf;
    notifyListeners();
  }

  void setSenha(String senha){
    this.senha = senha;
    notifyListeners();
  }

  @override
  String toString(){
    return 'CredentialsModel(nome: $nome, email: $email, '
        'cpf: $cpf, senha: $senha';
  }
}

class LoginModel extends ChangeNotifier{
  String email;
  String senha;

  LoginModel({
    this.email = '',
    this.senha = ''
  });

  void setEmail(String email){
    this.email = email;
    notifyListeners();
  }

  void setSenha(String senha){
    this.senha = senha;
    notifyListeners();
  }

  @override
  String toString(){
    return 'CredentialsModel(email: $email, senha: $senha';
  }
}