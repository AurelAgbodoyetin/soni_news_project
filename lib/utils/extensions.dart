import 'package:intl/intl.dart';

final DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm');

extension DateFormatter on DateTime {
  String toFormattedString() => formatter.format(this);
}
