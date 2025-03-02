import 'package:flutter/material.dart';

class OutlinedTextFieldComponent extends StatefulWidget {
  final String titulo;
  final String placeholder;
  final String supportingText;
  final bool isError;
  final String errorText;
  final TextInputType keyboardType;
  final Function(String) onValueChange;

  const OutlinedTextFieldComponent({
    required this.onValueChange,
    Key? key,
    this.titulo = '',
    this.placeholder = '',
    this.supportingText = '',
    this.isError = false,
    this.errorText = '',
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  _OutlinedTextFieldComponentState createState() =>
      _OutlinedTextFieldComponentState();
}

class _OutlinedTextFieldComponentState extends State<OutlinedTextFieldComponent> {
  late TextEditingController _controller;

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

  void _onTextChanged(String input) {
    String newValue = input;
    if (widget.keyboardType == TextInputType.number) {
      newValue = input.replaceAll(RegExp(r'[^0-9]'), '');
    }
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
        if (widget.titulo.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(widget.titulo, style: Theme.of(context).textTheme.bodyMedium),
          ),
        TextFormField(
          controller: _controller,
          keyboardType: widget.keyboardType,
          onChanged: _onTextChanged,
          decoration: InputDecoration(
            hintText: widget.placeholder,
            errorText: widget.isError ? widget.errorText : null,
            helperText: widget.isError ? null : widget.supportingText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }
}
