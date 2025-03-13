import 'package:digprev_flutter/ui/core/widgets/explanatoryTextWidget.dart';
import 'package:digprev_flutter/ui/core/widgets/titleToolTip.dart';
import 'package:flutter/material.dart';

class RadioButtonWidget extends FormField<String>{
  RadioButtonWidget({
    required String labelText,
    required String toolTipText,
    required List<String> radioTexts,
    required FormFieldSetter<String> onChanged,
    String? initialSelection,
    List<String>? explanatoryTexts,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    Key? key,

}):super(
    key: key,
    initialValue: initialSelection,
    validator: validator,
    onSaved: onSaved,
    builder: (FormFieldState<String> state){
      return RadioButtonWidgetStateful(
        labelText: labelText,
        tooltipText: toolTipText,
        radioTexts: radioTexts,
        initialSelection: state.value,
        onChanged: (String? value) {
          state.didChange(value);
          onChanged(value);
                },
        state: state,
      );
    }
  );
}

class RadioButtonWidgetStateful extends StatefulWidget {
  final String labelText;
  final String tooltipText;
  final String? initialSelection;
  final List<String> radioTexts;
  final List<String>? explanatoryTexts;
  final Function(String?) onChanged;
  final FormFieldState<String> state;

  const RadioButtonWidgetStateful({
    required this.labelText,
    required this.tooltipText,
    required this.radioTexts,
    required this.onChanged,
    required this.state,
    this.explanatoryTexts,
    this.initialSelection,
  });

  @override
  _RadioButtonWidgetState createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidgetStateful> {
  String? selectedOption;

  @override
  void initState() {
    super.initState();
    if (widget.radioTexts.contains(widget.initialSelection)) {
      selectedOption = widget.initialSelection;
    }
  }

  @override
  void didUpdateWidget(covariant RadioButtonWidgetStateful oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.radioTexts.contains(widget.initialSelection)) {
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
        if (widget.explanatoryTexts?.isNotEmpty ?? false)
          ExplanatoryTextWidget(
            explanatoryText: widget.explanatoryTexts!,
          ),
        TitleToolTip(title:widget.labelText,
        tooltipText: widget.tooltipText,),
        Column(
          children: widget.radioTexts.map((String text) {
            return RadioListTile<String>(
              title: Text(text, style: Theme.of(context).textTheme.titleSmall),
              value: text,
              groupValue: selectedOption,
              onChanged: (String? value) {
                setState(() {
                  selectedOption = value;
                });
                widget.onChanged(value);
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
