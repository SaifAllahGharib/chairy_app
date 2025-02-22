import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppThemes {
  static final TextStyle _textStyleColorWhite =
      GoogleFonts.roboto(color: Colors.white);
  static final TextStyle _textStyleColorBlack =
      GoogleFonts.roboto(color: Colors.black);
  static const TextSelectionThemeData _textSelectionThemeData =
      TextSelectionThemeData(
    cursorColor: AppColors.primaryColor,
    selectionColor: AppColors.primaryColor,
    selectionHandleColor: AppColors.primaryColor,
  );

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textSelectionTheme: _textSelectionThemeData,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      bodyLarge: _textStyleColorWhite,
      bodyMedium: _textStyleColorWhite,
      bodySmall: _textStyleColorWhite,
      titleLarge: _textStyleColorWhite,
      titleMedium: _textStyleColorWhite,
      titleSmall: _textStyleColorWhite,
      labelLarge: _textStyleColorWhite,
      labelMedium: _textStyleColorWhite,
      labelSmall: _textStyleColorWhite,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.black,
    textSelectionTheme: _textSelectionThemeData,
    textTheme: TextTheme(
      bodyLarge: _textStyleColorBlack,
      bodyMedium: _textStyleColorBlack,
      bodySmall: _textStyleColorBlack,
      titleLarge: _textStyleColorBlack,
      titleMedium: _textStyleColorBlack,
      titleSmall: _textStyleColorBlack,
      labelLarge: _textStyleColorBlack,
      labelMedium: _textStyleColorBlack,
      labelSmall: _textStyleColorBlack,
    ),
  );
}
