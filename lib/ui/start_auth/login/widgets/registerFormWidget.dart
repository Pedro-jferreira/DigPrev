
import 'package:digprev_flutter/domain/models/user/credentialsModel.dart';
import 'package:digprev_flutter/domain/validators/registerLoginValidators.dart';
import 'package:digprev_flutter/ui/core/states/layoutState.dart';
import 'package:digprev_flutter/ui/core/widgets/date_Picker.dart';
import 'package:digprev_flutter/ui/core/widgets/password_Text_Field.dart';
import 'package:digprev_flutter/ui/core/widgets/text_Field.dart';
import 'package:digprev_flutter/ui/start_auth/login/view_models/loginViewModel.dart';
import 'package:digprev_flutter/utils/layoutUtils.dart';
import 'package:flutter/material.dart';
import 'package:lucid_validation/src/types/validation_result.dart';

class RegisterFormComponent extends StatefulWidget {
  final ValueChanged<bool>? onFormValidationChanged;
  final VoidCallback onLoginPressed;
  final LoginViewModel loginViewModel;

  const RegisterFormComponent({
    required this.onLoginPressed,
    required this.loginViewModel,
    Key? key,
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
  final TextEditingController dataNascimentoController =TextEditingController();
  final TextEditingController senhaConfirmController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final UserValidator validator = UserValidator();
  final NomeValidator nomeValidator = NomeValidator();
  final DataNascimentoValidator dateValidator = DataNascimentoValidator();
  final CPFValidator cpfValidator = CPFValidator();
  final EmailValidator emailValidator = EmailValidator();
  final SenhaValidator senhaValidator = SenhaValidator();
  final TelefoneValidator telefoneValidator = TelefoneValidator();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final CredentialsModel credentials = CredentialsModel();

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
  bool isTelefoneError = false;
  String errorTelefone = '';

  @override
  void dispose() {
    nomeController.dispose();
    cpfController.dispose();
    emailController.dispose();
    senhaController.dispose();
    dataNascimentoController.dispose();
    senhaConfirmController.dispose();
    telefoneController.dispose();
    super.dispose();
  }

  bool _validateForm() {
    final ValidationResult result = validator.validate(credentials);
    return result.isValid;
  }

  @override
  Widget build(BuildContext context) {
    return Card(color: Theme.of(context).colorScheme.surface,
      margin: const EdgeInsets.all(2),
      child: dynamicScreenSize(context)
    );
  }

  Widget dynamicScreenSize(BuildContext context) {
    final LayoutState layoutState = determineLayoutState(context);
    switch (layoutState) {
      case LayoutState.mobile:
        return smallScreen();
      case LayoutState.smallTablet:
        return smallScreen();
      case LayoutState.tablet:
        return biggerScreen();
      case LayoutState.desktop:
        return biggerScreen();
    }
  }

  Widget biggerScreen() {
    return SizedBox(
        height: 350,
        child: SingleChildScrollView(
          child: centerRegisterForm()
        )
    );
  }

  Widget smallScreen() {
    return SizedBox(
        height: 600,
        child: SingleChildScrollView(
            child: centerRegisterForm()
        )
    );
  }

  Widget centerRegisterForm() {
    String? senhaDigitada = '';
    return Form(
      key: _formKey,
      onChanged: _validateForm,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget> [
                Text(
                  'Cadastro',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  labelText: 'Nome',
                  placeholderText: 'Digite seu Nome Aqui',
                  supportingText: 'Ex: José da Silva',
                  toolTipText: 'Digite o seu nome completo',
                  onChanged: credentials.setNome,
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
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  labelText: 'CPF',
                  placeholderText: 'Digite seu CPF',
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
                  onChanged: credentials.setCpf,
                ),
                const SizedBox(height: 10),
                CustomTextField(
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
                    errorEmail = 'E-mail inválido, ex: joaosilva@gmail.com';
                    return errorEmail;
                  },
                  onChanged: credentials.setEmail,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  labelText: 'Telefone',
                  keyboardType: TextInputType.number,
                  placeholderText: 'Digite seu telefone',
                  supportingText: 'Ex: (00) 00000-0000',
                  toolTipText: 'Digite seu telefone corretamente',
                  validator: (String? value) {
                    final ValidationResult result = telefoneValidator
                        .validate(value ?? '');
                    if (result.isValid) {
                      isTelefoneError == false;
                      return null;
                    }
                    isTelefoneError == true;
                    errorTelefone = 'Telefone inválido, ex: (00) 00000-0000';
                    return errorTelefone;
                  },
                  onChanged: credentials.setTelefone,
                ),
                const SizedBox(height: 10),
                DatePicker(
                  title: 'Data de Nascimento' ,
                  supportingText: 'Ex: 01/01/2001',
                    tooltipText: 'Escolha através do calendário a sua data'
                        'de nascimento.',
                    onDateSelected: (DateTime date) {
                      credentials.setDataNascimento(date);
                    },
                ),
                const SizedBox(height: 10),
                PasswordTextField(
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
                  onValueChange: credentials.setSenha,
                ),
                const SizedBox(height: 10),
                PasswordTextField(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Se já tiver cadastro, '),
                    TextButton(
                      onPressed: () {
                        widget.onLoginPressed();
                      },
                      child: Text(
                        'clique aqui.',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ListenableBuilder(
                    listenable: credentials,
                    builder: (BuildContext context, Widget? child) {
                      return ElevatedButton(
                        onPressed: _validateForm() ? () {
                          widget.onLoginPressed();
                          widget.loginViewModel.cadastrar(credentials);
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
                      );
                    }
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
