import 'package:digprev_flutter/domain/models/user/credentialsModel.dart';
import 'package:lucid_validation/lucid_validation.dart';

class UserValidator extends LucidValidator<CredentialsModel>{
  final CredentialsModel credentials = CredentialsModel();
  UserValidator(){
    final String pattern = (r'^[A-Za-zÀ-ÖØ-öø-ÿ\s]+$');
    ruleFor((CredentialsModel user) => user.nome, key: 'nome')
        .notEmpty()
        .matchesPattern(pattern);
    ruleFor((CredentialsModel user) => user.email, key: 'email')
        .notEmpty()
        .validEmail();
    ruleFor((CredentialsModel user) => user.cpf, key: 'cpf')
        .notEmpty()
        .validCPF();
    ruleFor((CredentialsModel user) => user.senha, key: 'senha')
        .notEmpty()
        .mustHaveUppercase()
        .mustHaveLowercase()
        .mustHaveNumber()
        .minLength(6);
    ruleFor((CredentialsModel user) => user.dataNascimento,
        key: 'dataNascimento')
        .isNotNull();
  }
}

class NomeValidator extends LucidValidator<String> {
  NomeValidator() {
    final String pattern = (r'^[A-Za-zÀ-ÖØ-öø-ÿ\s]+$');
    ruleFor((String nome) => nome, key: '')
        .notEmpty()
        .matchesPattern(pattern);
  }
}

class EmailValidator extends LucidValidator<String> {
  EmailValidator() {
    ruleFor((String email) => email, key: '')
        .notEmpty()
        .validEmail();
  }
}

class CPFValidator extends LucidValidator<String> {
  CPFValidator() {
    ruleFor((String cpf) => cpf, key: 'cpf')
        .notEmpty()
        .validCPF();
  }
}

class SenhaValidator extends LucidValidator<String> {
  SenhaValidator() {
    ruleFor((String senha) => senha, key: '')
        .notEmpty()
        .mustHaveUppercase()
        .mustHaveLowercase()
        .mustHaveNumber()
        .minLength(6);
  }
}

class DataNascimentoValidator extends LucidValidator<DateTime> {
  DataNascimentoValidator() {
    ruleFor((DateTime dataNascimento) => dataNascimento, key: '')
        .isNotNull();
  }
}

class LoginValidator extends LucidValidator<LoginModel>{
  final LoginModel loginModel = LoginModel();
  LoginValidator(){
    ruleFor((LoginModel user) => user.email, key: 'email')
        .notEmpty()
        .validEmail();
    ruleFor((LoginModel user) => user.senha, key: 'senha')
        .notEmpty()
        .mustHaveUppercase()
        .mustHaveLowercase()
        .mustHaveNumber()
        .minLength(6);
  }
}
