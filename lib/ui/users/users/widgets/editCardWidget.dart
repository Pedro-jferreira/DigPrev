import 'package:digprev_flutter/domain/models/user/credentialsModel.dart';
import 'package:digprev_flutter/domain/validators/registerLoginValidators.dart';
import 'package:digprev_flutter/ui/users/users/view_models/usersViewModel.dart';
import 'package:digprev_flutter/ui/users/users/widgets/informationCardWidget.dart';
import 'package:digprev_flutter/ui/users/users/widgets/inputUserCardWidget.dart';
import 'package:digprev_flutter/ui/users/users/widgets/titleAndActionWidget.dart';
import 'package:flutter/material.dart';
import 'package:lucid_validation/lucid_validation.dart';
import 'package:provider/provider.dart';

class EditCardWidget extends StatefulWidget {
  final CredentialsModel user;
  final UsersViewModel usersViewModel;
  const EditCardWidget({required this.user, required this.usersViewModel,
    super.key});

  @override
  State<EditCardWidget> createState() => _EditCardWidgetState();
}

class _EditCardWidgetState extends State<EditCardWidget> {
  bool isEditing = false;
  late TextEditingController emailController;
  late TextEditingController telefoneController;
  final EmailValidator emailValidator = EmailValidator();
  final TelefoneValidator telefoneValidator = TelefoneValidator();
  final CredentialsModel credentials = CredentialsModel();

  bool isEmailError = false;
  String errorEmail = '';
  bool isTelefoneError = false;
  String errorTelefone = '';

  void toggleEditMode() {
    setState(() {
      isEditing = !isEditing;
      if(!isEditing){
        widget.usersViewModel.atualizarUser(credentials);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: widget.user.email);
    telefoneController = TextEditingController(text: widget.user.telefone);
  }

  @override
  void dispose() {
    emailController.dispose();
    telefoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UsersViewModel>(
        builder: (BuildContext context, UsersViewModel users, Widget? child) {
          final CredentialsModel? user = users.user;
          if (user == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TitleActionWidget(
                  withAction: true,
                  title: 'Dados de Contato',
                  onTapAction: toggleEditMode,
                  usersViewModel: widget.usersViewModel,
                ),
                if (!isEditing) ...<Widget>[
                  InformationCardWidget(
                    iconType: 'email',
                    text: widget.user.email,
                    textType: 'E-mail',
                  ),
                  InformationCardWidget(
                    iconType: 'telefone',
                    text: widget.user.telefone,
                    textType: 'Telefone',
                  ),
                ] else
                  ...[
                    InputUserCardWidget(
                      labelText: 'E-mail',
                      placeholderText: 'Digite seu novo email.',
                      supportingText: 'Ex: josedasilva@gmail.com',
                      controller: emailController,
                      onChanged: credentials.setEmail,
                      validator: (String? value) {
                        final ValidationResult result = emailValidator
                            .validate(value ?? '');
                        if (result.isValid) {
                          isEmailError == false;
                          return null;
                        }
                        isEmailError == true;
                        errorEmail = 'Email inválido.';
                        return errorEmail;
                      },
                    ),
                    InputUserCardWidget(
                      labelText: 'Telefone',
                      placeholderText: 'Digite seu novo telefone.',
                      supportingText: 'Ex: (00) 00000-0000',
                      controller: telefoneController,
                      onChanged: credentials.setTelefone,
                      validator: (String? value) {
                        final ValidationResult result = telefoneValidator
                            .validate(value ?? '');
                        if (result.isValid) {
                          isTelefoneError == false;
                          return null;
                        }
                        isTelefoneError == true;
                        errorTelefone = 'Somente números são aceitos.';
                        return errorTelefone;
                      },
                    ),
                  ],
              ],
            ),
          );
        }
    );
  }
}
