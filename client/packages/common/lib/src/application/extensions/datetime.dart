import '../formatters/datetime_formatter.dart';

extension DateTimeEx on DateTime {
  String toDayMouthYearFormat() =>
      DateTimeFormatter(toLocal()).dayMouthYearFormat();
  String toDayMouthYearShortFormat() =>
      DateTimeFormatter(toLocal()).dayMouthYearShortFormat();
  String toFullFormat() => DateTimeFormatter(toLocal()).fullFormat();
  String toHHMMFormat() => DateTimeFormatter(toLocal()).hhmm();
  String toDay() => DateTimeFormatter(toLocal()).day();
  String toFormat() => DateTimeFormatter(toLocal()).format();

  DateTime get startOfDay => DateTime(year, month, day);
  DateTime get endOfDay => DateTime(year, month, day, 23, 59, 59, 999);
}
