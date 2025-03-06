import 'package:digprev_flutter/domain/models/answer/answer.dart';
import 'package:digprev_flutter/domain/models/enuns/inputType.dart';
import 'package:digprev_flutter/domain/models/question/option.dart';
import 'package:digprev_flutter/domain/models/question/question.dart';
import 'package:digprev_flutter/ui/core/widgets/outlinedTextFieldWidget.dart';
import 'package:digprev_flutter/ui/questionnaire/section/viewModels/formViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:result_command/result_command.dart';

class DynamicFormField extends StatelessWidget {
  const DynamicFormField({
    required this.question,
    required this.focusNode,
    required this.nextFocusNode,
    required this.answer,
    required this.viewModel,
    this.onSaved,
    this.validator,
    super.key,
  });

  final Question question;
  final Answer answer;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final FormViewModel viewModel;

  Future<void> _onChange(String value) async {
    final Answer answerUpdate;
    if (!answer.answers.isEmpty) {
      final Option option = answer.answers.first.copyWith(question: value);
      answerUpdate = answer.copyWith(answers: <Option>[option]);
    } else {
      final Option option = Option(
        id: 0,
        question: value,
        valueScore: null,
        intensity: null,
        days: null,
      );
      answerUpdate = answer.copyWith(answers: <Option>[option]);
    }
    await viewModel.update(answerUpdate, question.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    switch (question.inputType) {
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
          initialValue:
              (answer.answers.isNotEmpty ?? false)
                  ? answer.answers.first.question
                  : null,
          keyboardType: TextInputType.number,
          onSaved: onSaved,
          onValueChange: _onChange,
          title: question.question,
          toolTipText: question.tooltipText,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
          ],
        );
    }
  }
}
