import 'package:flutter/material.dart';

class OutlinedPasswordTextFieldComponent extends StatefulWidget {
  final String title;
  final String value;
  final String placeholder;
  final String supportingText;
  final bool isError;
  final String errorText;
  final FormFieldValidator<String>? validator;
  final Function(String) onValueChange;

  const OutlinedPasswordTextFieldComponent({
    Key? key,
    this.title = '',
    this.value = '',
    this.placeholder = '',
    this.supportingText = '',
    this.isError = false,
    this.errorText = '',
    this.validator,
    required this.onValueChange,
  }) : super(key: key);

  @override
  _OutlinedPasswordTextFieldComponentState createState() =>
      _OutlinedPasswordTextFieldComponentState();
}

class _OutlinedPasswordTextFieldComponentState
    extends State<OutlinedPasswordTextFieldComponent> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onValueChange,
      obscureText: !passwordVisible,
      decoration: InputDecoration(
        labelText: widget.title,
        hintText: widget.placeholder,
        errorText: widget.isError ? widget.errorText : null,
        helperText: widget.isError ? null : widget.supportingText,
        border: OutlineInputBorder(),
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
    );
  }
}
