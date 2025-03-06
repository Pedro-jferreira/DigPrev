import 'package:digprev_flutter/ui/core/widgets/titleToolTip.dart';
import 'package:flutter/material.dart';

class RadioButton extends FormField<String>{
  RadioButton({
    required List<String> radioOptions,
    required String textQuestion,
    required String tooltipText,
    Key? key,
    String? initialSelection,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    FormFieldSetter<String>? onChanged,
}):super(
    key: key,
    initialValue: initialSelection,
    validator: validator,
    onSaved: onSaved,
    builder: (FormFieldState<String> state){
      return RadioButtonComponent(
        radioOptions: radioOptions,
        textQuestion: textQuestion,
        initialSelection: state.value,
        tooltipText: tooltipText,
        onSelectionChanged: (String value) {
          state.didChange(value);
          if (onChanged != null) {
            onChanged(value);
          }
        },
        state: state,
      );
    }
  );
}

class RadioButtonComponent extends StatefulWidget {
  final List<String> radioOptions;
  final String textQuestion;
  final String? initialSelection;
  final Function(String) onSelectionChanged;
  final String tooltipText;
  final FormFieldState<String> state;

  const RadioButtonComponent({
    required this.radioOptions,
    required this.textQuestion,
    required this.onSelectionChanged,
    required this.tooltipText,
    required this.state,
    this.initialSelection,
  });

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
      children: <Widget>[
        TitleToolTip(title:widget.textQuestion,
        tooltipText: widget.tooltipText,),
        Column(
          children: widget.radioOptions.map((String text) {
            return RadioListTile<String>(
              title: Text(text, style: Theme.of(context).textTheme.titleSmall),
              value: text,
              groupValue: selectedOption,
              onChanged: (String? value) {
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
