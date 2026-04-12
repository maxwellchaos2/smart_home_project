import '../formatters/number_formatter.dart';

extension NumEx on num {
  String toPriceFormat({String? locale, String symbol = '₸'}) =>
      NumberFormatter(this).toPriceFormat(locale: locale, symbol: symbol);
  String toFormat() => NumberFormatter(this).toFormat();
}
