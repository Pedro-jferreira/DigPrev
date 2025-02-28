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
  final String labelText;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final FormFieldValidator<String>? validator;
  final ValueChanged<DateTime> onDateSelected;

  const DatePickerWidget({
    required this.labelText,
    required this.onDateSelected,
    super.key,
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
    return TextFormField(
      validator:widget.validator ,
      canRequestFocus: false,
      controller: _dateController,
      readOnly: true,
      decoration: InputDecoration(
        labelText: widget.labelText,
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_today),
          onPressed: _selectDate,
        ),
      ),
    );
  }
}
