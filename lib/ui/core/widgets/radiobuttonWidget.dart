import 'package:digprev_flutter/ui/core/widgets/titleToolTip.dart';
import 'package:digprev_flutter/ui/core/widgets/toolTipWidget.dart';
import 'package:flutter/material.dart';

class RadioButtonComponent extends StatefulWidget {
  final List<String> radioOptions;
  final String textQuestion;
  final String? initialSelection;
  final Function(String) onSelectionChanged;
  final String tooltipText;

  const RadioButtonComponent({
    Key? key,
    this.radioOptions = const ['Calls', 'Missed', 'Friends'],
    this.textQuestion = 'Qual a sua renda mensal?',
    this.initialSelection,
    required this.onSelectionChanged,
    this.tooltipText = 'Breve explicação dos assuntos.',
  }) : super(key: key);

  @override
  _RadioButtonComponentState createState() => _RadioButtonComponentState();
}

class _RadioButtonComponentState extends State<RadioButtonComponent> {
  String? selectedOption;

  @override
  void initState() {
    super.initState();
    if (widget.radioOptions.contains(widget.initialSelection)) {
      selectedOption = widget.initialSelection;
    }
  }

  @override
  void didUpdateWidget(covariant RadioButtonComponent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.radioOptions.contains(widget.initialSelection)) {
      setState(() {
        selectedOption = widget.initialSelection;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleToolTip(title:widget.textQuestion,
        tooltipText: widget.tooltipText,),
        Column(
          children: widget.radioOptions.map((text) {
            return RadioListTile<String>(
              title: Text(text, style: Theme.of(context).textTheme.titleSmall),
              value: text,
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value;
                });
                widget.onSelectionChanged(value!);
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
