import 'package:digprev_flutter/ui/core/widgets/titleToolTip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatefulWidget {
  final String labelText;
  final String toolTipText;
  final String placeholderText;
  final String supportingText;
  final String? initialValue;
  final Function(String) onChanged;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const TextFieldWidget({
    required this.labelText,
    required this.toolTipText,
    required this.placeholderText,
    required this.supportingText,
    required this.onChanged,
    this.initialValue,
    this.onSaved,
    this.validator,
    this.focusNode,
    this.onFieldSubmitted,
    this.keyboardType,
    this.inputFormatters,
    Key? key,
  });

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget>{
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TitleToolTip(title: widget.labelText, tooltipText: widget.toolTipText),
        TextFormField(
          decoration: InputDecoration(
            hintText: widget.placeholderText,
            helperText: widget.supportingText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
          initialValue: widget.initialValue,
          onChanged: widget.onChanged,
          onSaved: widget.onSaved,
          validator: widget.validator,
          focusNode: widget.focusNode,
          onFieldSubmitted: widget.onFieldSubmitted,
          keyboardType: widget.keyboardType,
          inputFormatters: widget.inputFormatters,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ],
    );
  }
}
