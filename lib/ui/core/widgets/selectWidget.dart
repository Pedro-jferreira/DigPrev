import 'package:digprev_flutter/ui/core/widgets/titleToolTip.dart';
import 'package:digprev_flutter/ui/core/widgets/toolTipWidget.dart';
import 'package:flutter/material.dart';

class SelectComponent extends StatefulWidget {
  final String textInputQuestion;
  final String textTooltip;
  final String textPlaceholderInput;
  final String supportingText;
  final List<String> selectTexts;
  final Function(int, String) onItemSelected;
  final bool isError;
  final String selectedValue;

  const SelectComponent({
    Key? key,
    this.textInputQuestion = "",
    this.textTooltip = "Breve explicação dos gêneros.",
    this.textPlaceholderInput = "Selecione o seu gênero",
    this.supportingText = "",
    this.selectTexts = const ["Alexander", "Isabella", "Alexander", "Isabella"],
    required this.onItemSelected,
    this.isError = false,
    required this.selectedValue,
  }) : super(key: key);

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
      children: [
       TitleToolTip(
         title: widget.textInputQuestion,
         tooltipText: widget.textTooltip,
       ),
        DropdownButtonFormField<String>(
          value: selectedText.isEmpty ? null : selectedText,
          hint: Text(widget.textPlaceholderInput),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            errorText: widget.isError ? "Seleção obrigatória" : null,
            helperText: widget.supportingText,
            suffixIcon: const Icon(Icons.arrow_drop_down),
          ),
          items: widget.selectTexts.asMap().entries.map((entry) {
            return DropdownMenuItem<String>(
              value: entry.value,
              child: Text(entry.value),
            );
          }).toList(),
          onChanged: (value) {
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
