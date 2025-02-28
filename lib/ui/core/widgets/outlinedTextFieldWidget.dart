import 'package:digprev_flutter/ui/core/widgets/titleToolTip.dart';
import 'package:digprev_flutter/ui/core/widgets/toolTipWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OutlinedTextFieldComponent extends StatelessWidget {
  final String title;
  final String? initialValue;
  final String? placeholder;
  final String? supportingText;
  final String toolTipText;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;
  final Function(String) onValueChange;

  const OutlinedTextFieldComponent({
    required this.onValueChange,
    required this.title,
    required this.toolTipText,
    Key? key,
    this.initialValue,
    this.placeholder,
    this.supportingText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TitleToolTip(
          title: title,
          tooltipText: toolTipText,
        ),
        TextFormField(
          initialValue: initialValue,
          validator: validator,
          keyboardType: keyboardType,
          onChanged: onValueChange,
          inputFormatters:inputFormatters,
          decoration: InputDecoration(
            hintText: placeholder,
            helperText: supportingText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }
}
