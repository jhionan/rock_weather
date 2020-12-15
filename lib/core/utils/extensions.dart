
import 'package:intl/intl.dart';

extension DatetimeFormatter on DateTime {
  String toHumanDate() {
    DateFormat dateFormat = DateFormat('dd/MM/yyyy - HH:mm');
    try {
      return dateFormat.format(this.toLocal());
    } catch (e) {
      return '';
    }
  }
}