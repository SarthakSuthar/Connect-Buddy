import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF0D2D32);
  static const Color dividerColor = Color(0xFFD9D9D9);
}

//Text Size: large, medium, small
//font weight : bold, regular, light

class AppTheme {
  static const TextStyle largeBold = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: 'Jost',
  );

  static const TextStyle largeRegular = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.normal,
    fontFamily: 'Jost',
  );

  static const TextStyle largeLite = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w300,
    fontFamily: 'Jost',
  );

  static const TextStyle mediumBold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontFamily: 'Jost',
  );

  static const TextStyle mediumRegular = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    fontFamily: 'Jost',
  );

  static const TextStyle mediumLite = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w300,
    fontFamily: 'Jost',
  );

  static const TextStyle smallBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    fontFamily: 'Jost',
  );

  static const TextStyle smallRegular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontFamily: 'Jost',
  );

  static const TextStyle smallLite = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    fontFamily: 'Jost',
  );

  static ThemeData theme = ThemeData(
    useMaterial3: true,
    textTheme: TextTheme(
      labelLarge: largeBold,
      labelMedium: largeRegular,
      labelSmall: largeLite,

      titleLarge: mediumBold,
      titleMedium: mediumRegular,
      titleSmall: mediumLite,

      bodyLarge: smallBold,
      bodyMedium: smallRegular,
      bodySmall: smallLite,
    ),

    dividerColor: AppColors.dividerColor,

    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      onPrimary: Colors.white,
      secondary: Colors.blueAccent,
      onSecondary: Colors.blue,
      error: Colors.redAccent,
      onError: Colors.redAccent,
      surface: Colors.white,
      // onSurface: Colors.grey,
    ),
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(Colors.white),
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.primaryColor;
        }
        return Colors.white;
      }),
      side: const BorderSide(color: AppColors.primaryColor),
    ),
  );
}
