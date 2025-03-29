import 'package:digprev_flutter/domain/models/answer/answer.dart';
import 'package:digprev_flutter/domain/models/enums/inputType.dart';
import 'package:digprev_flutter/domain/models/question/explanatoryTexts.dart';
import 'package:digprev_flutter/domain/models/question/option.dart';
import 'package:digprev_flutter/domain/models/question/question.dart';
import 'package:digprev_flutter/ui/core/widgets/check_box_group.dart';
import 'package:digprev_flutter/ui/core/widgets/input_Slide.dart';
import 'package:digprev_flutter/ui/core/widgets/text_Field.dart';
import 'package:digprev_flutter/ui/core/widgets/radio_Button.dart';
import 'package:digprev_flutter/ui/core/widgets/select.dart';
import 'package:digprev_flutter/ui/core/widgets/time_Input_field.dart';
import 'package:digprev_flutter/ui/questionnaire/form/viewModels/formViewModel.dart';
import 'package:digprev_flutter/utils/formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DynamicFormField extends StatefulWidget {
  const DynamicFormField({
    required this.question,
    required this.answer,
    required this.viewModel,
    required this.disabled,
    this.onSaved,
    this.validator,
    super.key,
  });

  final Question question;
  final Answer answer;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final FormViewModel viewModel;
  final List<String> disabled;

  @override
  State<DynamicFormField> createState() => _DynamicFormFieldState();
}

class _DynamicFormFieldState extends State<DynamicFormField> {
  @override
  Widget build(BuildContext context) {
    switch (widget.question.inputType) {
      case InputType.SELECT:
        return _buildSelect();
      case InputType.RADIOBUTTON:
        return _buildRadioButton();
      case InputType.SIM_NAO:
        return _buildRadioButtonYesOrNo();

      case InputType.NUMBERFIELD:
        return _buildNumberField();

      case InputType.SLIDER:
        return _buildSlider();

      case InputType.FREQUENCY_TIME:
        return _buildFrequencyTime();
      case InputType.CHECK_BOX_GROUP:
        return _buildCheckBoxGroup();
    }
  }

  Widget _buildCheckBoxGroup() {
    final List<String> initialValue = <String>[];

    if (widget.answer.answers.isNotEmpty) {
      for (Option option in widget.answer.answers) {
        initialValue.add(option.text!);
      }
    }

    return CheckboxGroup(
      labelText: widget.question.question,
      toolTipText: widget.question.tooltipText,
      initialSelection: initialValue.isNotEmpty ? initialValue : null,
      exclusiveLastItem: widget.question.exclusiveLastItem == true,
      checkboxTexts: _getOptions(),
      onChanged: _onCheckBox,
      validator: (List<String>? selected) {
        if (selected == null || selected.isEmpty) {
          return 'Selecione ao menos uma opção';
        }
        return null;
      },
    );
  }

  Widget _buildSelect() {
    return Select(
      labelText: widget.question.question,
      tooltipText: widget.question.tooltipText,
      placeholderText: widget.question.placeholder,
      supportingText: widget.question.supportingText,
      onChanged: _onItemSelected,
      initialValue:
          widget.answer.answers.isNotEmpty
              ? widget.answer.answers.first.text
              : null,
      selectTexts: _getOptions(),
      onSaved: widget.onSaved,
      validator: _validateNotEmpty,
    );
  }

  Widget _buildRadioButton() {
    return RadioButton(
      disabled: widget.disabled.contains(widget.question.id),
      initialSelection:
          widget.answer.answers.isNotEmpty
              ? widget.answer.answers.first.text
              : null,
      labelText: widget.question.question,
      toolTipText: widget.question.tooltipText,
      onSaved: widget.onSaved,
      validator: _validateNotEmpty,
      onChanged: _onItemSelected,
      explanatoryTexts: _getExplanatoryTexts(),
      radioTexts: _getOptions(),
    );
  }

  Widget _buildRadioButtonYesOrNo() {
    final String? initialSelection =
        widget.answer.answers.isNotEmpty
            ? widget.answer.answers.first.text
            : null;
    if (initialSelection != null) {
      _dynamicDisabled(widget.answer.answers.first);
    }

    return RadioButton(
      disabled: widget.disabled.contains(widget.question.id),
      initialSelection:
          widget.answer.answers.isNotEmpty
              ? widget.answer.answers.first.text
              : null,
      labelText: widget.question.question,
      toolTipText: widget.question.tooltipText,
      onSaved: widget.onSaved,
      validator: _validateNotEmpty,
      onChanged: _onItemSelectedYesOrNo,
      explanatoryTexts: _getExplanatoryTexts(),
      radioTexts: _getOptions(),
    );
  }

  Widget _buildNumberField() {
    return CustomTextField(
      labelText: widget.question.question,
      placeholderText: widget.question.placeholder,
      supportingText: widget.question.supportingText,
      initialValue:
          widget.answer.answers.isNotEmpty
              ? widget.answer.answers.first.text
              : null,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      onSaved: widget.onSaved,
      onChanged: _onChange,
      toolTipText: widget.question.tooltipText,
      inputFormatters: <TextInputFormatter>[DecimalTextInputFormatter()],
      validator: widget.validator ?? _validateNotEmpty,
    );
  }

  Widget _buildSlider() {
    return InputSlider(
      valueMin:
          widget.answer.answers.isNotEmpty
              ? widget.answer.answers.first.text
              : null,
      labelText: widget.question.question,
      tooltipText: widget.question.tooltipText,
      supportingText: widget.question.supportingText,
      selectTexts: _getOptions(),
      explanatoryTexts: _getExplanatoryTexts(),
      onChanged: _onItemSelected,
    );
  }

  Widget _buildFrequencyTime() {
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
    if (widget.answer.answers.isNotEmpty) {
      option = widget.answer.answers.first;
      _dynamicDisabled(option);
    }
    return TimeInputField(
      initialValues: (
        days: option.days,
        hours: option.hours,
        minutes: option.minutess,
        isSelect: option.noneOption!,
      ),
      disabled: widget.disabled.contains(widget.question.id),
      title: widget.question.question,
      tooltip: widget.question.tooltipText,
      onChanged: _onChangeTime,
      explanatoryText: _getExplanatoryTexts(),
    );
  }

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
    final Answer answerUpdate = widget.answer.copyWith(
      answers: <Option>[option],
    );
    await widget.viewModel.update(answerUpdate, widget.question.id.toString());
  }

  Future<void> _onItemSelected(String? value) async {
    if (value != null) {
      final Option option = widget.question.optionsQuestions.firstWhere(
        (Option opt) => opt.text == value,
      );
      final Answer answerUpdate = widget.answer.copyWith(
        answers: <Option>[option],
      );
      await widget.viewModel.update(
        answerUpdate,
        widget.question.id.toString(),
      );
    }
  }

  Future<void> _onCheckBox(List<String>? select) async {
    if (select != null) {
      final List<Option> options =
          widget.question.optionsQuestions.where((Option a) {
            return select.contains(a.text);
          }).toList();
      final Answer answerUpdate = widget.answer.copyWith(answers: options);
      await widget.viewModel.update(
        answerUpdate,
        widget.question.id.toString(),
      );
    }else{
      final Answer answerUpdate = widget.answer.copyWith(answers: <Option>[]);
      await widget.viewModel.update(
        answerUpdate,
        widget.question.id.toString(),
      );
    }
  }

  Future<void> _onItemSelectedYesOrNo(String? value) async {
    if (value != null) {
      final Option option = widget.question.optionsQuestions.firstWhere(
        (Option opt) => opt.text == value,
      );
      final Answer answerUpdate = widget.answer.copyWith(
        answers: <Option>[option],
      );
      await widget.viewModel.update(
        answerUpdate,
        widget.question.id.toString(),
      );
      _dynamicDisabled(option);
    } else {
      final Answer answerUpdate = widget.answer.copyWith(answers: <Option>[]);
      await widget.viewModel.update(
        answerUpdate,
        widget.question.id.toString(),
      );
    }
  }

  Future<void> _onChangeTime(
    int? days,
    int? hours,
    int? minutes,
    bool? isSelect,
  ) async {
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

    final bool isEmpty =
        days == null &&
        hours == null &&
        minutes == null &&
        (isSelect == null || isSelect == false);
    if (isEmpty) {
      final Answer answerUpdate = widget.answer.copyWith(answers: <Option>[]);
      await widget.viewModel.update(
        answerUpdate,
        widget.question.id.toString(),
      );
    } else {
      final Answer answerUpdate = widget.answer.copyWith(
        answers: <Option>[option],
      );
      await widget.viewModel.update(
        answerUpdate,
        widget.question.id.toString(),
      );
    }
    _dynamicDisabled(option);
  }

  void addDisabled(String value) {
    if (!widget.disabled.contains(value)) {
      setState(() {
        widget.disabled.add(value);
      });
    }
  }

  void removeDisabled(String value) {
    setState(() {
      if (widget.disabled.contains(value)) {
        setState(() {
          widget.disabled.remove(value);
        });
      }
    });
  }

  void _dynamicDisabled(Option option) {
    if (!widget.disabled.contains(widget.question.id)) {
      if (widget.question.inputType == InputType.SIM_NAO) {
        if (option.text == 'Não' && widget.question.disableQuestions != null) {
          for (String value in widget.question.disableQuestions!) {
            addDisabled(value);
          }
        }
        if (option.text == 'Sim' && widget.question.disableQuestions != null) {
          for (String value in widget.question.disableQuestions!) {
            removeDisabled(value);
          }
        }
      }
      if (widget.question.inputType == InputType.FREQUENCY_TIME) {
        if (option.noneOption == true &&
            widget.question.disableQuestions != null) {
          for (String value in widget.question.disableQuestions!) {
            addDisabled(value);
          }
        }
      }
      if (widget.question.inputType == InputType.FREQUENCY_TIME) {
        if (option.noneOption == false &&
            widget.question.disableQuestions != null) {
          for (String value in widget.question.disableQuestions!) {
            removeDisabled(value);
          }
        }
      }
    }
  }

  String? _validateNotEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Este campo não pode estar vazio.';
    }
    return null;
  }

  List<String>? _getExplanatoryTexts() {
    final List<String> texts = <String>[];
    if (widget.question.explanatoryTexts != null) {
      for (ExplanatoryTexts e in widget.question.explanatoryTexts!) {
        if (e.explanatoryText != null ) {
          texts.add(e.explanatoryText!);
        }
      }
    }
    return texts;
  }

  List<String> _getOptions() {
    return widget.question.optionsQuestions
        .map((Option option) => option.text!)
        .toList();
  }
}
