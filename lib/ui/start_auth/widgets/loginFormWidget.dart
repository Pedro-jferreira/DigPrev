import 'package:digprev_flutter/domain/validators/registerLoginValidators.dart';
import 'package:digprev_flutter/ui/core/widgets/outlinedPasswordTextFielWidget.dart';
import 'package:digprev_flutter/ui/core/widgets/textFieldWidget.dart';
import 'package:digprev_flutter/domain/models/user/credentialsModel.dart';
import 'package:digprev_flutter/ui/start_auth/view_models/loginViewModel.dart';
import 'package:flutter/material.dart';
import 'package:lucid_validation/lucid_validation.dart';

class LoginFormComponent extends StatefulWidget {
  final ValueChanged<bool>? onFormValidationChanged;
  final VoidCallback onRegisterPressed;
  final LoginViewModel loginViewModel;

  const LoginFormComponent({
    required this.onRegisterPressed,
    required this.loginViewModel,
    Key? key,
    this.onFormValidationChanged,
  }) : super(key: key);

  @override
  _LoginFormComponentState createState() => _LoginFormComponentState();
}

class _LoginFormComponentState extends State<LoginFormComponent> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final EmailValidator emailValidator = EmailValidator();
  final SenhaValidator senhaValidator = SenhaValidator();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LoginModel loginModel = LoginModel();
  final LoginValidator loginValidator = LoginValidator();

  bool isEmailError = false;
  String errorEmail = '';
  bool isSenhaError = false;
  String errorSenha = '';

  @override
  void dispose() {
    emailController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  bool _validateForm() {
    final ValidationResult result = loginValidator.validate(loginModel);
    return result.isValid;
  }

  @override
  Widget build(BuildContext context) {
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
                        'Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                        TextFieldWidget(
                          labelText: 'Email',
                          placeholderText: 'Digite seu e-mail',
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
                            errorEmail = 'E-mail inválido, '
                                'ex: joaosilva@gmail.com';
                            return errorEmail;
                          },
                          onChanged: loginModel.setEmail
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
                            return null;
                          }
                          isSenhaError == true;
                          errorSenha = 'Deve ter letra maiúscula, minúscula, '
                              'número e 6 letras.';
                          return errorSenha;
                        },
                        onValueChange: loginModel.setSenha
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                          const Text('Não tem conta?'),
                          TextButton(
                              onPressed: (){
                                widget.onRegisterPressed();
                              },
                              child: const Text(
                                  'Cadastre-se',
                                  style: TextStyle(color: Color(0xff2d4578))
                              )
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ListenableBuilder(
                          listenable: loginModel,
                          builder: (BuildContext context, Widget? child) {
                            return ElevatedButton(
                              onPressed: _validateForm() ? () {
                                widget.loginViewModel.login(loginModel);
                              } : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context)
                                    .colorScheme.primary,
                                disabledBackgroundColor:
                                Theme.of(context).colorScheme.outline,
                              ),
                              child: const Text(
                                'ENTRAR',
                                style: TextStyle(
                                  color: Color(0xffffffff),
                                ),
                              ),
                            );
                          }
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
