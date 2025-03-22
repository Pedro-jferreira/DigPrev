import 'package:digprev_flutter/ui/core/states/unicodeState.dart';
import 'package:digprev_flutter/ui/core/widgets/explanatory_Text.dart';
import 'package:digprev_flutter/ui/core/widgets/slide.dart';
import 'package:digprev_flutter/ui/core/widgets/title_Tool_Tip.dart';
import 'package:flutter/material.dart';

class InputSlider extends StatefulWidget {
  final String labelText;
  final String tooltipText;
  final String supportingText;
  final List<String>? explanatoryTexts;
  final List<String> selectTexts;
  final String? valueMin;
  final Function(String?) onChanged;
  final FormFieldSetter<String>? onSaved;

  const InputSlider({
    required this.labelText,
    required this.tooltipText,
    required this.supportingText,
    required this.selectTexts,
    required this.explanatoryTexts,
    required this.onChanged,
    this.valueMin,
    this.onSaved,
    Key? key,
  });


  @override
  _InputSliderState createState() => _InputSliderState();
}

class _InputSliderState extends State<InputSlider> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.valueMin;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TitleToolTip(title: widget.labelText, tooltipText: widget.tooltipText),
        if(widget.explanatoryTexts != null)
        ExplanatoryText(
          explanatoryText: widget.explanatoryTexts!,
          valueMax: widget.selectTexts.length,
          state: UnicodeState.Enum,
        ),
        CustomSlider(
          initialValue: (selectedValue != null) ?double.parse(selectedValue!): 1 ,
          max: widget.selectTexts.length,
          onValueChanged: (String value) {
            setState(() {
              selectedValue = value.toString();
            });
            widget.onChanged(selectedValue);
          },
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Ex: ${widget.supportingText}',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        )
      ],
    );
  }
}
