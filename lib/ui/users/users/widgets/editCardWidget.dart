import 'package:digprev_flutter/domain/models/user/user.dart';
import 'package:digprev_flutter/domain/validators/registerLoginValidators.dart';
import 'package:digprev_flutter/ui/users/users/widgets/informationCardWidget.dart';
import 'package:digprev_flutter/ui/users/users/widgets/inputUserCardWidget.dart';
import 'package:digprev_flutter/ui/users/users/widgets/titleAndActionWidget.dart';
import 'package:flutter/material.dart';
import 'package:lucid_validation/lucid_validation.dart';

class EditCardWidget extends StatefulWidget {
  final UserModel user;
  const EditCardWidget({required this.user, super.key});

  @override
  State<EditCardWidget> createState() => _EditCardWidgetState();
}

class _EditCardWidgetState extends State<EditCardWidget> {
  bool isEditing = false;
  late TextEditingController emailController;
  late TextEditingController telefoneController;
  final EmailValidator emailValidator = EmailValidator();
  final TelefoneValidator telefoneValidator = TelefoneValidator();

  bool isEmailError = false;
  String errorEmail = '';
  bool isTelefoneError = false;
  String errorTelefone = '';

  void toggleEditMode() {
    setState(() {
      isEditing = !isEditing;
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
    return Card(
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TitleActionWidget(
              withAction: true,
              title: 'Dados de Contato',
            onTapAction: toggleEditMode,
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
          ] else ...[
            InputUserCardWidget(
              labelText: 'E-mail',
              placeholderText: 'Digite seu novo email.',
              supportingText: 'Ex: josedasilva@gmail.com',
              controller: emailController,
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
}
