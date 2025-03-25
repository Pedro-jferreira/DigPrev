import 'package:digprev_flutter/ui/core/states/unicodeState.dart';
import 'package:digprev_flutter/ui/core/widgets/explanatory_Text.dart';
import 'package:digprev_flutter/ui/core/widgets/title_Tool_Tip.dart';
import 'package:flutter/material.dart';

class RadioButton extends FormField<String> {
  RadioButton({
    required String labelText,
    required String toolTipText,
    required List<String> radioTexts,
    required FormFieldSetter<String> onChanged,
    bool disabled = false,
    String? initialSelection,
    List<String>? explanatoryTexts,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    Key? key,
  }) : super(
         key: key,
         initialValue: initialSelection,
         validator: disabled ? null : validator,
         onSaved: onSaved,
         autovalidateMode: AutovalidateMode.onUserInteraction,
         builder: (FormFieldState<String> state) {
           return RadioButtonWidgetStateful(
             labelText: labelText,
             tooltipText: toolTipText,
             radioTexts: radioTexts,
             explanatoryTexts: explanatoryTexts,
             initialSelection: state.value,
             disabled: disabled,
             onChanged: (String? value) {
               if (!disabled) {
                 state.didChange(value);
                 onChanged(value);
               }
             },
             state: state,
           );
         },
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
  final bool disabled;

  const RadioButtonWidgetStateful({
    required this.labelText,
    required this.tooltipText,
    required this.radioTexts,
    required this.onChanged,
    required this.state,
    this.disabled = false,
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.disabled && selectedOption != null) {
        setState(() {
          selectedOption = null;
        });
        widget.onChanged.call(null);
      }
    });

    final bool hasError = widget.state.hasError;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TitleToolTip(title: widget.labelText, tooltipText: widget.tooltipText),
        if (widget.explanatoryTexts != null)
          ExplanatoryText(
            explanatoryText: widget.explanatoryTexts!,
            state: UnicodeState.Hifen,
          ),
        Column(
          children:
              widget.radioTexts.map((String text) {
                return RadioListTile<String>(
                  title: Text(
                    text,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color:
                          widget.disabled
                              ? Theme.of(
                                context,
                              ).colorScheme.onSurface.withValues(alpha: 0.38)
                              : (hasError
                                  ? Theme.of(context).colorScheme.error
                                  : null),
                    ),
                  ),
                  value: text,
                  groupValue: selectedOption,
                  onChanged:
                      widget.disabled
                          ? null // Desativa o clique
                          : (String? value) {
                            setState(() {
                              selectedOption = value;
                            });
                            widget.state.didChange(value);
                            widget.onChanged(value);
                          },
                );
              }).toList(),
        ),
        if (hasError)
          Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 10.0),
            child: Text(
              widget.state.errorText!,
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}
