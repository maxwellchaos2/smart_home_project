import 'dart:ui';

extension HexString on String {
  Color asColor() => Color(int.parse(replaceAll('#', '0xff')));
}

extension HexColor on Color {
  String asString() =>
      '#${value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
}
