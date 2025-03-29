import 'package:digprev_flutter/ui/core/states/unicodeState.dart';
import 'package:digprev_flutter/ui/core/widgets/explanatory_Text.dart';
import 'package:digprev_flutter/ui/core/widgets/title_Tool_Tip.dart';
import 'package:flutter/material.dart';

class CheckboxGroup extends FormField<List<String>> {
  CheckboxGroup({
    required String labelText,
    required String toolTipText,
    required List<String> checkboxTexts,
    required FormFieldSetter<List<String>> onChanged,
    bool disabled = false,
    bool exclusiveLastItem = false,
    List<String>? initialSelection,
    List<String>? explanatoryTexts,
    FormFieldSetter<List<String>>? onSaved,
    FormFieldValidator<List<String>>? validator,
    Key? key,
  }) : super(
         key: key,
         initialValue: initialSelection ?? <String>[],
         validator: disabled ? null : validator,
         onSaved: onSaved,
         autovalidateMode: AutovalidateMode.onUserInteraction,
         builder: (FormFieldState<List<String>> state) {
           return CheckboxGroupWidgetStateful(
             labelText: labelText,
             tooltipText: toolTipText,
             checkboxTexts: checkboxTexts,
             explanatoryTexts: explanatoryTexts,
             initialSelection: state.value,
             disabled: disabled,
             exclusiveLastItem: exclusiveLastItem,
             onChanged: (List<String> values) {
               if (!disabled) {
                 state.didChange(values);
                 onChanged(values);
               }
             },
             state: state,
           );
         },
       );
}

class CheckboxGroupWidgetStateful extends StatefulWidget {
  final String labelText;
  final String tooltipText;
  final List<String> checkboxTexts;
  final List<String>? initialSelection;
  final List<String>? explanatoryTexts;
  final Function(List<String>) onChanged;
  final FormFieldState<List<String>> state;
  final bool disabled;

  final bool exclusiveLastItem;

  const CheckboxGroupWidgetStateful({
    required this.labelText,
    required this.tooltipText,
    required this.checkboxTexts,
    required this.onChanged,
    required this.state,
    this.disabled = false,
    this.explanatoryTexts,
    this.initialSelection,
    this.exclusiveLastItem = false,
  });

  @override
  _CheckboxGroupWidgetState createState() => _CheckboxGroupWidgetState();
}

class _CheckboxGroupWidgetState extends State<CheckboxGroupWidgetStateful> {
  late List<String> selectedOptions;

  @override
  void initState() {
    super.initState();
    selectedOptions = List<String>.from(widget.initialSelection ?? <String>[]);
  }

  @override
  Widget build(BuildContext context) {
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
              widget.checkboxTexts.map((String text) {
                return CheckboxListTile(
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
                  value: selectedOptions.contains(text),
                  onChanged:
                      widget.disabled
                          ? null
                          : (bool? checked) {
                            setState(() {
                              if (checked == true) {
                                if (widget.exclusiveLastItem &&
                                    text == widget.checkboxTexts.last) {
                                  selectedOptions.clear();
                                  selectedOptions.add(text);
                                } else {
                                  if (widget.exclusiveLastItem &&
                                      selectedOptions.contains(
                                        widget.checkboxTexts.last,
                                      )) {
                                    selectedOptions.remove(
                                      widget.checkboxTexts.last,
                                    );
                                  }
                                  selectedOptions.add(text);
                                }
                              } else {
                                selectedOptions.remove(text);
                              }
                            });
                            widget.state.didChange(selectedOptions);
                            widget.onChanged(selectedOptions);
                          },
                  controlAffinity: ListTileControlAffinity.leading,
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
