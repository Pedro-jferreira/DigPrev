import 'package:digprev_flutter/domain/models/answer/answer.dart';
import 'package:digprev_flutter/domain/models/enuns/inputType.dart';
import 'package:digprev_flutter/domain/models/question/explanatoryTexts.dart';
import 'package:digprev_flutter/domain/models/question/option.dart';
import 'package:digprev_flutter/domain/models/question/question.dart';
import 'package:digprev_flutter/ui/core/widgets/input_Slide.dart';
import 'package:digprev_flutter/ui/core/widgets/slide.dart';
import 'package:digprev_flutter/ui/core/widgets/text_Field.dart';
import 'package:digprev_flutter/ui/core/widgets/radio_Button.dart';
import 'package:digprev_flutter/ui/core/widgets/select.dart';
import 'package:digprev_flutter/ui/core/widgets/time_Input_field.dart';
import 'package:digprev_flutter/ui/questionnaire/form/viewModels/formViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DynamicFormField extends StatelessWidget {
  const DynamicFormField({
    required this.question,
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
  final FormViewModel viewModel;

  Future<void> _onChange(String value) async {
    final Option option = Option(
      counter: 0,
      text: value,
      valueScore: null,
      intensity: null,
      days: null,
      hours: null,
      minutess: null,
      noneOption: null,
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

  Future<void> _onItemSelectedYerOrNo(String? value) async {
    if (value != null) {
      Option option = question.optionsQuestions.firstWhere(
        (Option opt) => opt.text == value,
      );
      final Answer answerUpdate = answer.copyWith(answers: <Option>[option]);
      await viewModel.update(answerUpdate, question.id.toString());
    }
  }

  String? _validateNotEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Este campo não pode estar vazio.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    switch (question.inputType) {
      case InputType.SELECT:
        return Select(
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
          validator: _validateNotEmpty,
        );
      case InputType.RADIOBUTTON:
        List<String>? texts = <String>[];
        if (question.explanatoryTexts != null) {
          for (ExplanatoryTexts explanatoryTexts
              in question.explanatoryTexts!) {
            if (explanatoryTexts.explanatoryText != null) {
              texts.add(explanatoryTexts.explanatoryText!);
            }
          }
        } else
          texts = null;

        return RadioButton(
          initialSelection:
              (answer.answers.isNotEmpty) ? answer.answers.first.text : null,
          labelText: question.question,
          toolTipText: question.tooltipText,
          onSaved: onSaved,
          validator: _validateNotEmpty,
          onChanged: _onItemSelected,
          explanatoryTexts: texts,
          radioTexts:
              question.optionsQuestions
                  .map((Option option) => option.text!)
                  .toList(),
        );

      case InputType.NUMBERFIELD:
        return CustomTextField(
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
          validator: (String? value) {
            if (validator != null) {
              return validator!(value);
            }
            return _validateNotEmpty(value); // 🔥 Aplica validação
          },
        );
      case InputType.SLIDER:
        List<String>? texts = <String>[];
        if (question.explanatoryTexts != null) {
          for (ExplanatoryTexts explanatoryTexts
          in question.explanatoryTexts!) {
            if (explanatoryTexts.explanatoryText != null) {
              texts.add(explanatoryTexts.explanatoryText!);
            }
          }
        } else
          texts = null;
        return InputSlider(
          valueMin: (answer.answers.isNotEmpty) ? answer.answers.first.text : null,
            labelText: question.question,
            tooltipText: question.tooltipText,
            supportingText: question.supportingText,
            selectTexts:   question.optionsQuestions
                .map((Option option) => option.text!)
                .toList(),
            explanatoryTexts: (texts!= null)? texts : <String>[],
            onChanged: _onItemSelected,
        );

      case InputType.SIM_NAO:
        List<String>? texts = <String>[];
        if (question.explanatoryTexts != null) {
          for (ExplanatoryTexts explanatoryTexts
              in question.explanatoryTexts!) {
            if (explanatoryTexts.explanatoryText != null) {
              texts.add(explanatoryTexts.explanatoryText!);
            }
          }
        } else
          texts = null;

        return RadioButton(
          initialSelection:
              (answer.answers.isNotEmpty) ? answer.answers.first.text : null,
          labelText: question.question,
          toolTipText: question.tooltipText,
          onSaved: onSaved,
          validator: _validateNotEmpty,
          onChanged: _onItemSelected,
          explanatoryTexts: texts,
          radioTexts:
              question.optionsQuestions
                  .map((Option option) => option.text!)
                  .toList(),
        );
      case InputType.FREQUENCY_TIME:
        Option option = const Option(
          counter: 1,
          text: '',
          valueScore: 0.0,
          intensity: null,
          days: null,
          hours: null,
          minutess: null,
          noneOption: false,
        );
        if (answer.answers.isNotEmpty) {
          option = answer.answers.first;
        }
        return TimeInputField(
          initialValues: (
            days: option.days,
            hours: option.hours,
            minutes: option.minutess,
            isSelect: option.noneOption!,
          ),
          title: question.question,
          tooltip: question.tooltipText,
          onChanged:onChangeTime,
        );
    }
  }
  Future<void> onChangeTime(int? days, int? hours, int? minutes, bool? isSelect) async {
    final Option option = Option(
      counter: 1,
      text: '',
      valueScore: 0.0,
      intensity: null,
      days: days,
      hours: hours,
      minutess: minutes,
      noneOption: isSelect,
    );
    final Answer answerUpdate = answer.copyWith(answers: <Option>[option]);
    await viewModel.update(answerUpdate, question.id.toString());
  }
}
