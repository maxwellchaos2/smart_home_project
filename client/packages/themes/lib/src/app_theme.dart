import 'package:common/common.dart';
import 'package:themes/src/app_text_theme.dart';

import 'input_theme.dart';

class AppTheme {
  AppTheme({
    ThemeData? lightTheme,
    ThemeData? darkTheme,
  })  : _lightTheme = lightTheme ?? defaultLightTheme,
        _darkTheme = darkTheme ?? defaultDarkTheme;

  final ThemeData _lightTheme;
  final ThemeData _darkTheme;

  ThemeData get light => _lightTheme;
  ThemeData get dark => _darkTheme;

  static const Color defaultPrimaryColor = Color(0xFFF49911);

  static ThemeData get defaultLightTheme => ThemeData(
        primaryColor: defaultPrimaryColor,
        primaryColorLight: const Color.fromARGB(255, 252, 243, 198),
        brightness: Brightness.light,
      );

  static ThemeData get defaultDarkTheme => ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
        primaryColor: defaultPrimaryColor,
        primaryColorLight: const Color.fromARGB(255, 252, 243, 198),
        scaffoldBackgroundColor: const Color(0xFF585858),
        colorScheme: const ColorScheme.dark(
          primary: defaultPrimaryColor,
          onPrimary: Colors.white,
          surface: Color(0xFF3E3E3E),
          secondary: Color(0xFF6F6F6F),
          onSecondary: defaultPrimaryColor,
          surfaceTint: Colors.transparent,
        ),
        fontFamily: FontFamily.inter,
        fontFamilyFallback: const <String>[
          FontFamily.inter,
        ],
        textTheme: AppTextTheme.dark,
        inputDecorationTheme: AppInputDecorationTheme.dark,
        iconButtonTheme: IconButtonThemeData(style: IconButton.styleFrom()),
        package: 'assets',
        extensions: const [],
      );
}
