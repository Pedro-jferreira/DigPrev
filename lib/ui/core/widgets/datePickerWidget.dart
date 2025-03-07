import 'package:digprev_flutter/ui/core/widgets/titleToolTip.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/* DatePickerWidget - Um widget personalizado para seleção de datas.

 Como usar:
 ```dart
 DatePickerWidget(
   labelText: "Selecionar Data",
   onDateSelected: (DateTime date) {
     print("Data selecionada: \$date");
   },
   initialDate: DateTime(2023, 5, 10), // Opcional
   firstDate: DateTime(2000, 1, 1), // Opcional
   lastDate: DateTime(2030, 12, 31), // Opcional
 )
 ```

 Se os parâmetros opcionais `initialDate`, `firstDate` e `lastDate` não forem
 definidos:
 - `initialDate` será a data atual (`DateTime.now()`).
 - `firstDate` será 10 anos atrás da data atual.
 - `lastDate` será 10 anos à frente da data atual.

 © 2025 Pedro Ferreira*/
class DatePickerWidget extends StatefulWidget {
  final String? labelText;
  final String title;
  final String supportingText;
  final String tooltipText;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final FormFieldValidator<String>? validator;
  final ValueChanged<DateTime> onDateSelected;

  const DatePickerWidget({
    required this.onDateSelected,
    required this.title,
    required this.supportingText,
    required this.tooltipText,
    super.key,
    this.labelText,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.validator,
  });

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? selectedDate;
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialDate != null) {
      selectedDate = widget.initialDate;
      _dateController.text = DateFormat(
        'dd/MM/yyyy',
      ).format(widget.initialDate!);
    }
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate:
          widget.firstDate ??
          DateTime.now().subtract(const Duration(days: 3650)),
      lastDate:
          widget.lastDate ?? DateTime.now().add(const Duration(days: 3650)),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        _dateController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
      });
      widget.onDateSelected(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TitleToolTip(
          title: widget.title,
          tooltipText: widget.tooltipText,
        ),
        TextFormField(
          validator:widget.validator,
          canRequestFocus: false,
          controller: _dateController,
          readOnly: true,
          decoration: InputDecoration(
            helperText: widget.supportingText,
            labelText: widget.title,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            suffixIcon: IconButton(
              icon: const Icon(Icons.calendar_month),
              onPressed: _selectDate,
            ),
          ),
        ),
      ],
    );
  }
}
