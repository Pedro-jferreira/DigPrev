import 'package:flutter/material.dart';

class OutlinedPasswordTextFieldComponent extends StatefulWidget {
  final String titulo;
  final String value;
  final String placeholder;
  final String supportingText;
  final bool isError;
  final String errorText;
  final Function(String) onValueChange;

  const OutlinedPasswordTextFieldComponent({
    Key? key,
    this.titulo = "",
    this.value = "",
    this.placeholder = "",
    this.supportingText = "",
    this.isError = false,
    this.errorText = "",
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
        labelText: widget.titulo,
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
