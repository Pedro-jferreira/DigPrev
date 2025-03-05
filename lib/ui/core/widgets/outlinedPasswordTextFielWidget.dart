import 'package:digprev_flutter/ui/core/widgets/titleToolTip.dart';
import 'package:flutter/material.dart';

class OutlinedPasswordTextFieldComponent extends StatefulWidget {
  final String title;
  final String value;
  final String placeholder;
  final String supportingText;
  final String tooltipText;
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
    this.tooltipText = '',
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
  late TextEditingController _controller;
  bool passwordVisible = false;
  String? _errorText;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged(String input) {
    String newValue = input;
    setState(() {
      _controller.text = newValue;
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length),
      );
    });
    widget.onValueChange(newValue);
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
          onChanged: (value) {
            widget.onValueChange(value);
            if (widget.validator != null) {
              setState(() {
                _errorText = widget.validator!(value);
              });
            }
          },
          decoration: InputDecoration(
            labelText: widget.title,
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
