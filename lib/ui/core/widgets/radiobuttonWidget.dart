import 'package:digprev_flutter/ui/core/widgets/toolTipWidget.dart';
import 'package:flutter/material.dart';

class RadioButtonComponent extends StatefulWidget {
  final List<String> radioOptions;
  final String textQuestion;
  final String? initialSelection;
  final Function(String) onSelectionChanged;
  final String tooltipText;
  final String tooltipDescription;

  const RadioButtonComponent({
    Key? key,
    this.radioOptions = const ['Calls', 'Missed', 'Friends'],
    this.textQuestion = 'Qual a sua renda mensal?',
    this.initialSelection,
    required this.onSelectionChanged,
    this.tooltipText = 'Breve explicação dos assuntos.',
    this.tooltipDescription = 'Mais informações',
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
        Row(
          children: [
            Expanded(
              flex: 4,
              child: Text(
                widget.textQuestion,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            ToolTipWidget(
              labelText: widget.tooltipText,
            ),
          ],
        ),
        const SizedBox(height: 8),
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
