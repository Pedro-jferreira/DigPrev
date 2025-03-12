
import 'package:digprev_flutter/ui/core/widgets/explanatoryTextWidget.dart';
import 'package:digprev_flutter/ui/core/widgets/slideWidget.dart';
import 'package:digprev_flutter/ui/core/widgets/titleToolTip.dart';
import 'package:flutter/material.dart';

class InputSlideWidget extends StatefulWidget {
  final String labelText;
  final String tooltipText;
  final String supportingText;
  final List<String> explanatoryTexts;
  final List<String> selectTexts;
  final int? valueMin;
  final Function(String?) onChanged;
  final FormFieldSetter<String>? onSaved;

  const InputSlideWidget({
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
  _InputSlideWidgetState createState() => _InputSlideWidgetState();
}

class _InputSlideWidgetState extends State<InputSlideWidget> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TitleToolTip(title: widget.labelText, tooltipText: widget.tooltipText),
        ExplanatoryTextWidget(
          explanatoryText: widget.explanatoryTexts,
          valueMax: widget.selectTexts.length,
        ),
        SliderWidget(
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
