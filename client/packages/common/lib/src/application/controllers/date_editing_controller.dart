import 'package:common/common.dart';

class DateEditingController extends TextEditingControllerWithData<DateTime> {
  DateEditingController({required DateTime? date, Locale? locale})
      : super(data: date) {
    setData(data, locale: locale);
  }

  DateTime? get date => data;

  @protected
  @visibleForOverriding
  String toFormat(DateTime date, {Locale? locale}) {
    return DateTimeFormatter(date).dayMouthYearFormat(
        // locale: locale?.toLanguageTag(),
        );
  }

  @override
  void setData(DateTime? data, {Locale? locale}) {
    text = data == null ? '' : toFormat(data, locale: locale);
    super.setData(data);
  }
}
