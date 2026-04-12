final class DurationFormatter {
  final Duration duration;

  const DurationFormatter(this.duration);

  String timeHHMM([bool showUnits = false]) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    if (showUnits) {
      return '${twoDigits(duration.inHours)} ч $twoDigitMinutes мин';
    }
    return '${twoDigits(duration.inHours)}:$twoDigitMinutes';
  }

  String timeMMSS() {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '${twoDigits(duration.inMinutes)}:$twoDigitSeconds';
  }

  String timeFull() {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds';
  }

  String format() {
    if (duration.inDays > 0) {
      return '${duration.inDays} дн';
    }
    if (duration.inHours > 0) {
      return '${duration.inHours} ч';
    }
    if (duration.inMinutes > 0) {
      return '${duration.inMinutes} мин';
    }
    return '${duration.inSeconds} сек';
  }
}
