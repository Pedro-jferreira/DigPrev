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
      counter: 0,
      text: value,
      valueScore: null,
      intensity: null,
    );
    final Answer answerUpdate = answer.copyWith(answers: <Option>[option]);
    await viewModel.update(answerUpdate, question.id.toString());
  }

  Future<void> _onItemSelected(String? value) async {
    if (value != null) {
      final Option option = question.optionsQuestions.firstWhere(
        (Option opt) => opt.text == value,
      );
      final Answer answerUpdate = answer.copyWith(answers: <Option>[option]);
      await viewModel.update(answerUpdate, question.id.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (question.inputType) {
      case InputType.SELECT:
        return SelectWidget(
          labelText: question.question,
          tooltipText: question.tooltipText,
          placeholderText: question.placeholder,
          supportingText: question.supportingText,
          onChanged: _onItemSelected,
          initialValue:
              (answer.answers.isNotEmpty) ? answer.answers.first.text : null,
          selectTexts:
              question.optionsQuestions
                  .map((Option option) => option.text!)
                  .toList(),
          onSaved: onSaved,
          validator: validator,
        );
      case InputType.RADIOBUTTON:
        return RadioButtonWidget(
          initialSelection:
              (answer.answers.isNotEmpty) ? answer.answers.first.text : null,
          labelText: question.question,
          toolTipText: question.tooltipText,
          onSaved: onSaved,
          validator: validator,
          onChanged: _onItemSelected,
          radioTexts:
              question.optionsQuestions
                  .map((Option option) => option.text!)
                  .toList(),
        );

      case InputType.NUMBERFIELD:
        return TextFieldWidget(
          labelText: question.question,
          placeholderText: question.placeholder,
          supportingText: question.supportingText,
          initialValue:
              (answer.answers.isNotEmpty) ? answer.answers.first.text : null,
          keyboardType: TextInputType.number,
          onSaved: onSaved,
          onChanged: _onChange,
          toolTipText: question.tooltipText,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
          ],
        );
      case InputType.SLIDER:
        return Text(question.question);
      case InputType.SIM_NAO:
        return Text(question.question); //colocado pra parar de bugar
      case InputType.FREQUENCY_TIME:
        return Text(question.question); // colocado pra parar de bugar
    }
  }
}
