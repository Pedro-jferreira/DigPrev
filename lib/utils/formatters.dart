import 'package:intl/intl.dart';

String formatDate(DateTime dateTime, {String pattern = 'dd/MM/yyyy'}) {
  return DateFormat(pattern).format(dateTime);
}