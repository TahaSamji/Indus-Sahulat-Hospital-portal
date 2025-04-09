import 'package:intl/intl.dart';

String formatDateTimeReadable(DateTime dateTime, {bool convertToLocal = true}) {
  final timeToFormat = convertToLocal ? dateTime.toLocal() : dateTime;
  return DateFormat('EEEE, MMMM d \'at\' h:mm a').format(timeToFormat);
}