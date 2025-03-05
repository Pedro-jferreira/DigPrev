import 'package:digprev_flutter/ui/core/widgets/outlinedPasswordTextFielWidget.dart';
import 'package:digprev_flutter/ui/core/widgets/outlinedTextFieldWidget.dart';
import 'package:digprev_flutter/ui/start_auth/validators/registerLoginValidators.dart';
import 'package:flutter/material.dart';
import 'package:lucid_validation/src/types/validation_result.dart';

class RegisterFormComponent extends StatefulWidget {
  final ValueChanged<bool>? onFormValidationChanged;
  final VoidCallback onLoginPressed;

  const RegisterFormComponent({
    required this.onLoginPressed, Key? key,
    this.onFormValidationChanged,
  }) : super(key: key);

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
  final EmailValidator emailValidator = EmailValidator();
  final SenhaValidator senhaValidator = SenhaValidator();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late bool _isFormValid = false;

  bool isNomeError = false;
  String errorNome = '';
  bool isEmailError = false;
  String errorEmail = '';
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

  void _validateForm() {
    _isFormValid = _formKey.currentState?.validate() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    String? senhaDigitada = '';
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      margin: const EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        onChanged: _validateForm,
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
                    const SizedBox(height: 10),
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
                    const SizedBox(height: 10),
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
                        errorCpf = 'Somente números são aceitos, '
                            'ex: 000.000.000-00';
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
                    OutlinedTextFieldComponent(
                      title: 'Email',
                      placeholder: 'Digite seu e-mail',
                      supportingText: 'Ex: joaosilva@gmail.com',
                      toolTipText: 'Digite seu e-mail corretamente',
                      validator: (String? value) {
                        final ValidationResult result = emailValidator
                            .validate(value ?? '');
                        if (result.isValid) {
                          isEmailError == false;
                          return null;
                        }
                        isEmailError == true;
                        errorEmail = 'E-mail inválido, ex: joaosilva@gmail.com';
                        return errorEmail;
                      },
                      onValueChange: (String value) {
                        setState(() {
                          isEmailError = value.isEmpty;
                          errorEmail = isEmailError
                              ? 'E-mail não pode estar vazio'
                              : '';
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    OutlinedPasswordTextFieldComponent(
                      title: 'Senha',
                      placeholder: 'Digite sua Senha',
                      supportingText: 'Mínimo de 6 caracteres',
                      tooltipText: 'Deve ter letra maiúscula, minúscula, '
                          'número e 6 letras.',
                      validator: (String? value) {
                        final ValidationResult result = senhaValidator
                            .validate(value ?? '');
                        if (result.isValid) {
                          isSenhaError == false;
                          senhaDigitada = value;
                          return null;
                        }
                        isSenhaError == true;
                        errorSenha = 'Deve ter letra maiúscula, minúscula, '
                            'número e 6 letras.';
                        return errorSenha;
                      },
                      onValueChange: (String value) {
                        setState(() {
                          isSenhaError = value.length < 4;
                          errorSenha = isSenhaError ? 'Senha muito curta' : '';
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    OutlinedPasswordTextFieldComponent(
                      title: 'Confirme sua senha',
                      placeholder: 'Digite sua Senha',
                      supportingText: 'Mínimo de 6 caracteres',
                      tooltipText: 'Esta senha deve ser igual à digitada no '
                          'campo de Senha',
                      validator: (String? value) {
                        if (value == senhaDigitada) {
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
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _isFormValid ? () {
                          widget.onLoginPressed();
                        } : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context)
                              .colorScheme.primary,
                          disabledBackgroundColor:
                            Theme.of(context).colorScheme.outline,
                        ),
                        child: const Text(
                            'CADASTRAR  ',
                          style: TextStyle(
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
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
