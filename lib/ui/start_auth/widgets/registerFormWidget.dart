import 'package:digprev_flutter/ui/core/widgets/outlinedPasswordTextFielWidget.dart';
import 'package:digprev_flutter/ui/core/widgets/outlinedTextFieldWidget.dart';
import 'package:digprev_flutter/ui/start_auth/validators/registerLoginValidators.dart';
import 'package:flutter/material.dart';
import 'package:lucid_validation/src/types/validation_result.dart';

class RegisterFormComponent extends StatefulWidget {
  const RegisterFormComponent({super.key});

  @override
  _RegisterFormComponentState createState() => _RegisterFormComponentState();
}

class _RegisterFormComponentState extends State<RegisterFormComponent> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController senhaConfirmController = TextEditingController();
  final UserValidator validator = UserValidator();
  final NomeValidator nomeValidator = NomeValidator();
  final CPFValidator cpfValidator = CPFValidator();
  final SenhaValidator senhaValidator = SenhaValidator();

  bool isNomeError = false;
  String errorNome = '';
  bool isCpfError = false;
  String errorCpf = '';
  bool isSenhaError = false;
  String errorSenha = '';
  bool isSenhaConfirmError = false;
  String errorSenhaConfirm = '';

  @override
  void dispose() {
    nomeController.dispose();
    cpfController.dispose();
    emailController.dispose();
    senhaController.dispose();
    senhaConfirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      margin: const EdgeInsets.all(10),
      child: Form(
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget> [
                    Text(
                      'Cadastro',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20),
                    OutlinedTextFieldComponent(
                      title: 'Nome',
                      placeholder: 'Digite seu Nome Aqui',
                      supportingText: 'Ex: José da Silva',
                      toolTipText: 'Digite o seu nome completo',
                      validator: (String? value) {
                        final ValidationResult result = nomeValidator
                            .validate(value ?? '');
                        if (result.isValid) {
                          isNomeError == false;
                          return null;
                        }
                        isNomeError == true;
                        errorNome = 'Somente letras são aceitas.';
                        return errorNome;
                      },
                      onValueChange: (String value) {
                        setState(() {
                          isNomeError = value.isEmpty;
                          errorNome = isNomeError ? 'Nome não pode estar vazio'
                              : '';
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    OutlinedTextFieldComponent(
                      title: 'CPF',
                      placeholder: 'Digite seu CPF',
                      supportingText: 'Ex: 000.000.000-00',
                      toolTipText: 'Digite seu CPF corretamente',
                      validator: (String? value) {
                        final ValidationResult result = cpfValidator
                            .validate(value ?? '');
                        if (result.isValid) {
                          isCpfError == false;
                          return null;
                        }
                        isCpfError == true;
                        errorCpf = 'Somente números são aceitas.';
                        return errorCpf;
                      },
                      onValueChange: (String value) {
                        setState(() {
                          isCpfError = value.isEmpty;
                          errorCpf = isCpfError ? 'CPF não pode estar vazio'
                              : '';
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    OutlinedPasswordTextFieldComponent(
                      title: 'Senha',
                      placeholder: 'Digite sua Senha',
                      supportingText: 'Mínimo de 6 caracteres',
                      validator: (String? value) {
                        final ValidationResult result = senhaValidator
                            .validate(value ?? '');
                        if (result.isValid) {
                          isSenhaError == false;
                          return null;
                        }
                        isSenhaError == true;
                        errorSenha = 'Deve ter letra maiúscula, minúscula, '
                            'número, caracter especial e 6 letras.';
                        return errorSenha;
                      },
                      onValueChange: (String value) {
                        setState(() {
                          isSenhaError = value.length < 6;
                          errorSenha = isSenhaError ? 'Senha muito curta' : '';
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    OutlinedPasswordTextFieldComponent(
                      title: 'Confirme sua senha',
                      placeholder: 'Digite sua Senha',
                      supportingText: 'Mínimo de 6 caracteres',
                      validator: (String? value) {
                        if (value == senhaController.text) {
                          isSenhaConfirmError == false;
                          return null;
                        }
                        isSenhaConfirmError == true;
                        errorSenhaConfirm = 'As senhas não coincidem';
                        return errorSenhaConfirm;
                      },
                      onValueChange: (String value) {
                        setState(() {
                          isSenhaConfirmError = value != senhaController.text;
                          errorSenhaConfirm = isSenhaConfirmError
                              ? 'As senhas não coincidem' : '';
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
