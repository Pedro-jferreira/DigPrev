import 'package:flutter/material.dart';

class OutlinedTextFieldComponent extends StatelessWidget {
  final String titulo;
  final String value;
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
    this.value = '',
    this.placeholder = '',
    this.supportingText = '',
    this.isError = false,
    this.errorText = '',
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (titulo.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(titulo, style: Theme.of(context).textTheme.bodyMedium),
          ),
        TextFormField(
          keyboardType: keyboardType,
          onChanged: (String input) {
            if (keyboardType == TextInputType.number) {
              final String numericValue = input.replaceAll(
                RegExp(r'[^0-9]'),
                '',
              );
              onValueChange(numericValue);
            } else {
              onValueChange(input);
            }
          },
          decoration: InputDecoration(
            hintText: placeholder,
            errorText: isError ? errorText : null,
            helperText: isError ? null : supportingText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }
}
