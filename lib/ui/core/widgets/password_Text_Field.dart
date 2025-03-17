import 'package:digprev_flutter/ui/core/widgets/title_Tool_Tip.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final String title;
  final String value;
  final String placeholder;
  final String supportingText;
  final String tooltipText;
  final bool isError;
  final String errorText;
  final FormFieldValidator<String>? validator;
  final Function(String) onValueChange;

  const PasswordTextField({
    required this.onValueChange, Key? key,
    this.title = '',
    this.value = '',
    this.placeholder = '',
    this.supportingText = '',
    this.isError = false,
    this.tooltipText = '',
    this.errorText = '',
    this.validator,
  }) : super(key: key);

  @override
  _PasswordTextFieldState createState() =>
      _PasswordTextFieldState();
}

class _PasswordTextFieldState
    extends State<PasswordTextField> {
  late TextEditingController _controller;
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TitleToolTip(
          title: widget.title,
          tooltipText: widget.tooltipText,
        ),
        TextFormField(
          obscureText: !passwordVisible,
          validator: widget.validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (String value) {
            widget.onValueChange(value);
            if (widget.validator != null) {
              setState(() {
              });
            }
          },
          decoration: InputDecoration(
            hintText: widget.placeholder,
            helperText: widget.supportingText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            suffixIcon: IconButton(
              icon: Icon(
                passwordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  passwordVisible = !passwordVisible;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
