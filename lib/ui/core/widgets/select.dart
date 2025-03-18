import 'package:digprev_flutter/ui/core/widgets/title_Tool_Tip.dart';
import 'package:flutter/material.dart';

class Select extends StatefulWidget {
  final String labelText;
  final String tooltipText;
  final String placeholderText;
  final String supportingText;
  final String? initialValue;
  final List<String> selectTexts;
  final Function(String?) onChanged;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;

  const Select({
    required this.labelText,
    required this.tooltipText,
    required this.placeholderText,
    required this.supportingText,
    required this.selectTexts,
    required this.onChanged,
    this.initialValue,
    this.onSaved,
    this.validator,
    Key? key,
  });


  @override
  _SelectComponentState createState() => _SelectComponentState();
}

class _SelectComponentState extends State<Select> {
  String? selectedValue;
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      selectedValue = widget.initialValue!;
      selectedIndex = widget.selectTexts.indexOf(widget.initialValue!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TitleToolTip(title: widget.labelText, tooltipText: widget.tooltipText),
        DropdownButtonFormField<String>(
          hint: Text(widget.placeholderText),
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            helperText: widget.supportingText,
          ),
          value: selectedValue ?? widget.initialValue,
          items:
              widget.selectTexts.asMap().entries.map((
                MapEntry<int, String> entry,
              ) {
                return DropdownMenuItem<String>(
                  value: entry.value,
                  child: Text(entry.value),
                );
              }).toList(),
          onChanged: widget.onChanged,
          onSaved: widget.onSaved,
          validator: widget.validator,
        ),
      ],
    );
  }
}
