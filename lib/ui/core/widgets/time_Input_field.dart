import 'package:digprev_flutter/ui/core/widgets/title_Tool_Tip.dart';
import 'package:flutter/material.dart';

class TimeInputField extends StatefulWidget {
  final String title;
  final String tooltip;
  final bool isActive;
  final Function(int? days, int? hours, int? minutes, bool? isSelect)? onChanged;
  final ({int? days, int? hours, int? minutes, bool isSelect}) initialValues;

  const TimeInputField({
    required this.title,
    required this.tooltip,
    Key? key,
    this.isActive = true,
    this.onChanged,
    this.initialValues = const (days: null, hours: null, minutes: null, isSelect: false),
  }) : super(key: key);

  @override
  _TimeInputFieldState createState() => _TimeInputFieldState();
}

class _TimeInputFieldState extends State<TimeInputField> {
  late TextEditingController _daysController;
  late TextEditingController _hoursController;
  late TextEditingController _minutesController;
  late bool _isNoneSelected;

  @override
  void initState() {
    super.initState();

    _daysController = TextEditingController(
        text: widget.initialValues.days != null ? widget.initialValues.days.toString() : '');

    _hoursController = TextEditingController(
        text: widget.initialValues.hours != null ? widget.initialValues.hours.toString() : '');

    _minutesController = TextEditingController(
        text: widget.initialValues.minutes != null ? widget.initialValues.minutes.toString() : '');

    _isNoneSelected = widget.initialValues.isSelect;


    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onChanged?.call(
        int.tryParse(_daysController.text),
        int.tryParse(_hoursController.text),
        int.tryParse(_minutesController.text),
        _isNoneSelected,
      );
    });
  }

  void _clearFields() {
    _daysController.clear();
    _hoursController.clear();
    _minutesController.clear();
    setState(() {
      _isNoneSelected = true;
    });
    widget.onChanged?.call(null, null, null, true);
  }

  void _handleTextChanged() {
    if (_isNoneSelected) {
      setState(() {
        _isNoneSelected = false;
      });
    }
    widget.onChanged?.call(
      int.tryParse(_daysController.text),
      int.tryParse(_hoursController.text),
      int.tryParse(_minutesController.text),
      _isNoneSelected,
    );
  }

  void _handleCheckboxChanged(bool? value) {
    setState(() {
      _isNoneSelected = value ?? false;
      if (_isNoneSelected) {
        _clearFields();
      }
    });
    widget.onChanged?.call(null, null, null, _isNoneSelected);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TitleToolTip(title: widget.title, tooltipText: widget.tooltip),
        Row(
          children: <Widget>[
            Checkbox(
              value: _isNoneSelected,
              onChanged: widget.isActive ? _handleCheckboxChanged : null,
            ),
            const Text('Nenhum.'),
          ],
        ),
        if (!_isNoneSelected)
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  controller: _daysController,
                  enabled: widget.isActive,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Dias por semana'),
                  validator: (String? value) {
                    if (widget.isActive && (value == null || value.isEmpty)) {
                      return 'Obrigatório';
                    }
                    return null;
                  },
                  onChanged: (_) => _handleTextChanged(),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextFormField(
                  controller: _hoursController,
                  enabled: widget.isActive,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Horas'),
                  validator: (String? value) {
                    if (widget.isActive && (value == null || value.isEmpty)) {
                      return 'Obrigatório';
                    }
                    return null;
                  },
                  onChanged: (_) => _handleTextChanged(),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextFormField(
                  controller: _minutesController,
                  enabled: widget.isActive,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Minutos'),
                  validator: (String? value) {
                    if (widget.isActive && (value == null || value.isEmpty)) {
                      return 'Obrigatório';
                    }
                    return null;
                  },
                  onChanged: (_) => _handleTextChanged(),
                ),
              ),
            ],
          ),
      ],
    );
  }

  @override
  void dispose() {
    _daysController.dispose();
    _hoursController.dispose();
    _minutesController.dispose();
    super.dispose();
  }
}
