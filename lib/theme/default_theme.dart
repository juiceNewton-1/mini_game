import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultTheme {
  static const primary = Color(0xFF373747);
  static const onPrimary = Colors.white;
  static const secondary = Colors.white;
  static const onSecondary = Colors.black;
  static const error = Colors.red;
  static const onError = Colors.white;
  static const background = Colors.white;
  static const onBackground = Colors.white;
  static const surface = Color(0xFF9B9BB1);
  static const onSurface = Colors.white;

  static final theme = ThemeData(
    textTheme: TextTheme(
      displayLarge: GoogleFonts.roboto(
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
      ),
      displayMedium: GoogleFonts.roboto(
        fontWeight: FontWeight.w400,
        fontSize: 18.0,
      ),
      displaySmall: GoogleFonts.roboto(
        fontWeight: FontWeight.w400,
        fontSize: 12.0,
      ),
      titleMedium: GoogleFonts.roboto(
        fontWeight: FontWeight.w300,
        fontSize: 14.0,
      ),
    ).apply(
      bodyColor: onBackground,
      displayColor: onBackground,
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: primary,
      onPrimary: onPrimary,
      secondary: secondary,
      onSecondary: onSecondary,
      error: error,
      onError: onError,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
    ),
  );
}
