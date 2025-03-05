import 'package:digprev_flutter/domain/models/answer/answer.dart';
import 'package:digprev_flutter/domain/models/enuns/inputType.dart';
import 'package:digprev_flutter/domain/models/question/question.dart';
import 'package:digprev_flutter/ui/core/widgets/outlinedTextFieldWidget.dart';
import 'package:flutter/material.dart';

class DynamicFormField extends StatelessWidget {
  const DynamicFormField({
    required this.question,
    required this.onChanged,
    required this.focusNode,
    required this.nextFocusNode,
    this.answer,
    this.onSaved,
    this.validator,
    super.key,
  });

  final Question question;
  final Answer? answer;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final Function(String) onChanged;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;

  @override
  Widget build(BuildContext context) {
    switch(question.inputType){
      case InputType.TEXT_INPUT:
        return Text(question.question);
      case InputType.SELECT:
        return Text(question.question);
      case InputType.RADIO_BUTTOM:
        return Text(question.question);
      case InputType.SIM_NAO:
        return Text(question.question);
      case InputType.DATE:
        return Text(question.question);
      case InputType.NUMBER_INPUT:
        return OutlinedTextFieldComponent(
          keyboardType: TextInputType.number,
            onSaved: onSaved,
            onValueChange: onChanged,
            title: question.question,
            toolTipText: question.tooltipText);
    }
  }
}
