
import 'package:flutter/material.dart';

class InputUserCardWidget extends StatefulWidget {
  final String labelText;
  final String placeholderText;
  final String supportingText;
  final String? initialValue;
  final Function(String)? onChanged;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? keyboardType;
  final TextEditingController controller;

  const InputUserCardWidget({
    required this.labelText,
    required this.placeholderText,
    required this.supportingText,
    required this.controller,
    this.onChanged,
    this.initialValue,
    this.onSaved,
    this.validator,
    this.focusNode,
    this.onFieldSubmitted,
    this.keyboardType,
    super.key
  });

  @override
  State<InputUserCardWidget> createState() => _InputUserCardWidgetState();
}

class _InputUserCardWidgetState extends State<InputUserCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.placeholderText,
          helperText: widget.supportingText,
          labelText: widget.labelText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
        validator: widget.validator,
        focusNode: widget.focusNode,
        onFieldSubmitted: widget.onFieldSubmitted,
        keyboardType: widget.keyboardType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
