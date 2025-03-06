import 'package:digprev_flutter/ui/core/widgets/titleToolTip.dart';
import 'package:flutter/material.dart';

class SelectComponent extends StatefulWidget {
  final String textInputQuestion;
  final String textTooltip;
  final String textPlaceholderInput;
  final String supportingText;
  final List<String> selectTexts;
  final Function(int, String) onItemSelected;
  final String selectedValue;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;

  const SelectComponent({
    required this.textInputQuestion,
    required this.textTooltip,
    required this.textPlaceholderInput,
    required this.supportingText,
    required this.selectTexts,
    required this.onItemSelected,
    required this.selectedValue,
    this.onSaved,
    this.validator,
    Key? key,
  });

  @override
  _SelectComponentState createState() => _SelectComponentState();
}

class _SelectComponentState extends State<SelectComponent> {
  late String selectedText;
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedText = widget.selectedValue;
    selectedIndex = widget.selectTexts.indexOf(widget.selectedValue);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
       TitleToolTip(
         title: widget.textInputQuestion,
         tooltipText: widget.textTooltip,
       ),
        DropdownButtonFormField<String>(
          validator: widget.validator,
          onSaved: widget.onSaved,
          value: selectedText.isEmpty ? null : selectedText,
          hint: Text(widget.textPlaceholderInput),
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            helperText: widget.supportingText,
            suffixIcon: const Icon(Icons.arrow_drop_down),
          ),
          items: widget.selectTexts.asMap().entries.map((
              MapEntry<int, String> entry) {
            return DropdownMenuItem<String>(
              value: entry.value,
              child: Text(entry.value),
            );
          }).toList(),
          onChanged: (String? value) {
            if (value != null) {
              setState(() {
                selectedText = value;
                selectedIndex = widget.selectTexts.indexOf(value);
              });
              widget.onItemSelected(selectedIndex, value);
            }
          },
        ),
      ],
    );
  }
}
