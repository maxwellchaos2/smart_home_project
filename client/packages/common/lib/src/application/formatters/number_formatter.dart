import 'package:intl/intl.dart' as intl;

final class NumberFormatter {
  final num number;

  const NumberFormatter(this.number);

  String toPriceFormat({String? locale, String symbol = '\$'}) {
    // ignore: prefer_interpolation_to_compose_strings
    return ((intl.NumberFormat.currency(locale: locale, name: symbol)..minimumFractionDigits = 0)
          ..maximumFractionDigits = 8)
        .format(number);
  }

  String toFormat() {
    // ignore: prefer_interpolation_to_compose_strings
    return intl.NumberFormat("#,###").format(number).replaceAll(',', ' ');
  }
}
