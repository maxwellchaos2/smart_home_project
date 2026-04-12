import 'package:flutter/material.dart';

@immutable
class AppPrimaryFormButtonThemeData
    extends ThemeExtension<AppPrimaryFormButtonThemeData> {
  const AppPrimaryFormButtonThemeData({
    this.style,
  });

  final ButtonStyle? style;

  @override
  AppPrimaryFormButtonThemeData copyWith({
    ButtonStyle? buttonStyle,
  }) {
    return AppPrimaryFormButtonThemeData(
      style: buttonStyle,
    );
  }

  @override
  AppPrimaryFormButtonThemeData lerp(
      ThemeExtension<AppPrimaryFormButtonThemeData>? other, double t) {
    if (other is! AppPrimaryFormButtonThemeData) {
      return this;
    }
    return AppPrimaryFormButtonThemeData(
      style: ButtonStyle.lerp(style, other.style, t),
    );
  }

  @override
  String toString() => 'AppPrimaryFormButtonThemeData('
      'buttonStyle: ${style.toString()}'
      ')';
}

class AppSecondaryFormButtonThemeData
    extends ThemeExtension<AppSecondaryFormButtonThemeData> {
  const AppSecondaryFormButtonThemeData({
    this.style,
  });

  final ButtonStyle? style;

  @override
  AppSecondaryFormButtonThemeData copyWith({
    ButtonStyle? buttonStyle,
  }) {
    return AppSecondaryFormButtonThemeData(
      style: buttonStyle,
    );
  }

  @override
  AppSecondaryFormButtonThemeData lerp(
      ThemeExtension<AppSecondaryFormButtonThemeData>? other, double t) {
    if (other is! AppSecondaryFormButtonThemeData) {
      return this;
    }
    return AppSecondaryFormButtonThemeData(
      style: ButtonStyle.lerp(style, other.style, t),
    );
  }

  @override
  String toString() => 'AppFormButtonThemeData('
      'buttonStyle: ${style.toString()}'
      ')';
}

class AppOutlinedFormButtonThemeData
    extends ThemeExtension<AppOutlinedFormButtonThemeData> {
  const AppOutlinedFormButtonThemeData({
    this.style,
  });

  final ButtonStyle? style;

  @override
  AppOutlinedFormButtonThemeData copyWith({
    ButtonStyle? buttonStyle,
  }) {
    return AppOutlinedFormButtonThemeData(
      style: buttonStyle,
    );
  }

  @override
  AppOutlinedFormButtonThemeData lerp(
      ThemeExtension<AppOutlinedFormButtonThemeData>? other, double t) {
    if (other is! AppOutlinedFormButtonThemeData) {
      return this;
    }
    return AppOutlinedFormButtonThemeData(
      style: ButtonStyle.lerp(style, other.style, t),
    );
  }

  @override
  String toString() => 'AppFormButtonThemeData('
      'buttonStyle: ${style.toString()}'
      ')';
}
