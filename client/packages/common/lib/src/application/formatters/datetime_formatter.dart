import 'package:intl/intl.dart' as intl;

final class DateTimeFormatter {
  final DateTime dateTime;

  const DateTimeFormatter(this.dateTime);

  String dayMouthYearFormat() {
    return intl.DateFormat('dd MMMM yyyy').format(dateTime);
  }

  String dayMouthYearShortFormat() {
    return intl.DateFormat('dd.MM.yy').format(dateTime);
  }

  String fullFormat() {
    return intl.DateFormat('dd.MM.yyyy, HH:mm').format(dateTime);
  }

  String hhmm() {
    return intl.DateFormat('HH:mm').format(dateTime);
  }

  String dateApiFormat() {
    return intl.DateFormat('yyyy-MM-dd').format(dateTime);
  }

  String day() {
    DateTime now = DateTime.now().toLocal();
    DateTime localDateTime = dateTime.toLocal();

    if (localDateTime.day == now.day &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      return 'Сегодня';
    }

    DateTime yesterday = now.subtract(const Duration(days: 1));

    if (localDateTime.day == yesterday.day &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      return 'Вчера';
    }

    return intl.DateFormat('dd MMM', 'ru').format(localDateTime);
  }

  String format() {
    DateTime now = DateTime.now().toLocal();
    DateTime localDateTime = dateTime.toLocal();
    if (localDateTime.day == now.day &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      return hhmm();
    }
    if (localDateTime.year == now.year) {
      return day();
    }
    return dayMouthYearShortFormat();
  }
}
