import '../formatters/duration_formatter.dart';

extension DurationEx on Duration {
  String toHHMMFormat([bool showUnits = false]) =>
      DurationFormatter(this).timeHHMM(showUnits);
  String toFullFormat() => DurationFormatter(this).timeFull();
  String toMMSSFormat() => DurationFormatter(this).timeMMSS();
  String toFormat() => DurationFormatter(this).format();
}
