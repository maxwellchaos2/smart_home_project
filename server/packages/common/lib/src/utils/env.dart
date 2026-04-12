import 'dart:io';

abstract class ENV {
  static String fromKey(String key) =>
      Platform.environment[key] ?? String.fromEnvironment(key);

  static int fromKeyInt(String key) => int.parse(Platform.environment[key] ??
      String.fromEnvironment(key, defaultValue: '0'));
}
