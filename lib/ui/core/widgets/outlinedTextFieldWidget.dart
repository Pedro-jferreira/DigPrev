import 'package:digprev_flutter/ui/core/widgets/titleToolTip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OutlinedTextFieldComponent extends StatefulWidget {
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
        TitleToolTip(
          title: widget.title,
          tooltipText: widget.toolTipText,
        ),
        TextFormField(
          initialValue: widget.initialValue,
          validator: widget.validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: widget.keyboardType,
          onChanged: widget.onValueChange,
          inputFormatters: widget.inputFormatters,
          decoration: InputDecoration(
            hintText: widget.placeholder,
            helperText: widget.supportingText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }
}
