import 'package:flutter/material.dart';

abstract final class AppBoxShadows {
  static const dark = BoxShadow(
    color: Color.fromRGBO(73, 78, 97, 0.11),
    offset: Offset(0, 4),
    blurRadius: 10,
    spreadRadius: -3,
  );
}
