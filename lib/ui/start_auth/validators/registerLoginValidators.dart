import 'package:lucid_validation/lucid_validation.dart';

class UserRegister{
  String nome;
  String email;
  String cpf;
  String senha;

  UserRegister({
    required this.nome,
    required this.email,
    required this.cpf,
    required this.senha
  });
}

class UserValidator extends LucidValidator<UserRegister>{
  UserValidator(){
    final pattern = (r'^[A-Za-zÀ-ÖØ-öø-ÿ\s]+$');
    ruleFor((user) => user.nome, key: 'nome')
        .notEmpty()
        .matchesPattern(pattern);
    ruleFor((user) => user.email, key: 'email')
        .notEmpty()
        .validEmail();
    ruleFor((user) => user.cpf, key: 'cpf')
        .notEmpty()
        .validCPF();
    ruleFor((user) => user.senha, key: 'senha')
        .notEmpty()
        .mustHaveUppercase()
        .mustHaveLowercase()
        .mustHaveNumber()
        .mustHaveSpecialCharacter()
        .minLength(6);
  }
}

class NomeValidator extends LucidValidator<String> {
  NomeValidator() {
    final pattern = (r'^[A-Za-zÀ-ÖØ-öø-ÿ\s]+$');
    ruleFor((nome) => nome, key: '')
        .notEmpty()
        .matchesPattern(pattern);
  }
}

class EmailValidator extends LucidValidator<String> {
  EmailValidator() {
    ruleFor((email) => email, key: '')
        .notEmpty()
        .validEmail();
  }
}

class CPFValidator extends LucidValidator<String> {
  CPFValidator() {
    ruleFor((cpf) => cpf, key: 'cpf')
        .notEmpty()
        .validCPF();
  }
}

class SenhaValidator extends LucidValidator<String> {
  SenhaValidator() {
    ruleFor((senha) => senha, key: '')
        .notEmpty()
        .mustHaveUppercase()
        .mustHaveLowercase()
        .mustHaveNumber()
        .mustHaveSpecialCharacter()
        .minLength(6);
  }
}
