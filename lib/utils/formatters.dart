import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

String formatDate(DateTime dateTime, {String pattern = 'dd/MM/yyyy'}) {
  return DateFormat(pattern).format(dateTime);
}

class DecimalTextInputFormatter extends TextInputFormatter {
  final int decimalPlaces;

  DecimalTextInputFormatter({this.decimalPlaces = 2});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final String text = newValue.text;

    if (text.isEmpty) return newValue;

    // Permite apenas números e um ponto decimal
    if (!RegExp(r'^\d*\.?\d*$').hasMatch(text)) {
      return oldValue;
    }

    // Impede múltiplos pontos decimais
    if (text.contains('.') &&
        text.indexOf('.') != text.lastIndexOf('.')) {
      return oldValue;
    }

    // Limita a quantidade de casas decimais
    if (text.contains('.')) {
      final List<String> parts = text.split('.');
      if (parts.length > 1 && parts[1].length > decimalPlaces) {
        return oldValue;
      }
    }

    return newValue;
  }
}