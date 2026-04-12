import 'package:flutter/material.dart';

abstract final class AppTextTheme {
  static const _letterSpacing = -.5;
  static const TextTheme dark = TextTheme(
    displayLarge: TextStyle(
      fontSize: 57.0,
      fontWeight: FontWeight.w300,
      letterSpacing: _letterSpacing,
      height: 1.4,
    ),
    displayMedium: TextStyle(
      fontSize: 45.0,
      fontWeight: FontWeight.w300,
      letterSpacing: _letterSpacing,
      height: 1.4,
    ),
    displaySmall: TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.w400,
      letterSpacing: _letterSpacing,
      height: 1.4,
    ),
    headlineLarge: TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.w400,
      letterSpacing: _letterSpacing,
      height: 1.4,
    ),
    headlineMedium: TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.w400,
      letterSpacing: _letterSpacing,
      height: 1.4,
    ),
    headlineSmall: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w400,
      letterSpacing: _letterSpacing,
      height: 1.4,
    ),
    titleLarge: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      letterSpacing: _letterSpacing,
      height: 1.4,
    ),
    titleMedium: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      letterSpacing: _letterSpacing,
      height: 1.4,
    ),
    titleSmall: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      letterSpacing: _letterSpacing,
      height: 1.4,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      letterSpacing: _letterSpacing,
      height: 1.4,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      letterSpacing: _letterSpacing,
      height: 1.4,
    ),
    bodySmall: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      letterSpacing: _letterSpacing,
      height: 1.4,
    ),
    labelLarge: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      letterSpacing: _letterSpacing,
      height: 1.4,
    ),
    labelMedium: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      letterSpacing: _letterSpacing,
      height: 1.4,
    ),
    labelSmall: TextStyle(
      fontSize: 11.0,
      fontWeight: FontWeight.w400,
      letterSpacing: _letterSpacing,
      height: 1.4,
    ),
  );
}
