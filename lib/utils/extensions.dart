import 'package:intl/intl.dart';

final DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm');

extension DateeFormatter on DateTime {
  String toFormattedString() => formatter.format(this);
}
