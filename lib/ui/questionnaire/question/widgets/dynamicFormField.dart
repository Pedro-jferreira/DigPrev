import 'package:digprev_flutter/domain/models/answer/answer.dart';
import 'package:digprev_flutter/domain/models/enuns/inputType.dart';
import 'package:digprev_flutter/domain/models/question/option.dart';
import 'package:digprev_flutter/domain/models/question/question.dart';
import 'package:digprev_flutter/ui/core/widgets/textFieldWidget.dart';
import 'package:digprev_flutter/ui/core/widgets/radioButtonWidget.dart';
import 'package:digprev_flutter/ui/core/widgets/selectWidget.dart';
import 'package:digprev_flutter/ui/questionnaire/question/viewModels/formViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DynamicFormField extends StatelessWidget {
  const DynamicFormField({
    required this.question,
    required this.answer,
    required this.viewModel,
    this.focusNode,
    this.onSaved,
    this.validator,
    super.key,
  });

  final Question question;
  final Answer answer;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final FormViewModel viewModel;

  Future<void> _onChange(String value) async {
    final Option option = Option(
      id: 0,
      text: value,
      valueScore: null,
      intensity: null,
      days: null,
    );
    final Answer answerUpdate = answer.copyWith(answers: <Option>[option]);
    await viewModel.update(answerUpdate, question.id.toString());
  }

  Future<void> _onItemSelected(String? value) async {
    if(value != null){
      final Option option = question.options!.firstWhere(
            (Option opt) => opt.text == value,
      );
      final Answer answerUpdate = answer.copyWith(answers: <Option>[option]);
      await viewModel.update(answerUpdate, question.id.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    switch (question.inputType) {
      case InputType.TEXT_INPUT:
        return Text(question.question);
      case InputType.SELECT:
        return SelectWidget(
          labelText: question.question,
          tooltipText: question.tooltipText,
          placeholderText: question.placeholder,
          supportingText: question.supportingText,
          onChanged: _onItemSelected,
          initialValue:
              (answer.answers.isNotEmpty)
                  ? answer.answers.first.text
                  : null,
          selectTexts:
          question.options?.map((Option option) => option.text!).toList() ??
              <String>[],
          onSaved: onSaved,
          validator: validator,

        );
      case InputType.RADIO_BUTTOM:
        return RadioButtonWidget(
          initialSelection:
              (answer.answers.isNotEmpty)
                  ? answer.answers.first.text
                  : null,
          labelText: question.question,
          toolTipText: question.tooltipText,
          onSaved: onSaved,
          validator: validator,
          onChanged: _onItemSelected,
          radioTexts:
              question.options?.map((Option option) => option.text!).toList() ??
              <String>[],
        );

      case InputType.SIM_NAO:
        return RadioButtonWidget(
          initialSelection:
          (answer.answers.isNotEmpty)
              ? answer.answers.first.text
              : null,
          labelText: question.question,
          toolTipText: question.tooltipText,
          onSaved: onSaved,
          validator: validator,
          onChanged: _onItemSelected,
          radioTexts:
          question.options?.map((Option option) => option.text!).toList() ??
              <String>[],
        );
      case InputType.DATE:
        return Text(question.question);
      case InputType.NUMBER_INPUT:
        return TextFieldWidget(
          labelText: question.question,
          placeholderText: question.placeholder,
          supportingText: question.supportingText,
          initialValue:
              (answer.answers.isNotEmpty)
                  ? answer.answers.first.text
                  : null,
          keyboardType: TextInputType.number,
          onSaved: onSaved,
          onChanged: _onChange,
          toolTipText: question.tooltipText,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
          ],
        );
    }
  }

}
