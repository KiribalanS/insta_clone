// Light Theme Colors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomThemes {
  static const ColorScheme lightColorScheme = ColorScheme.light(
    brightness: Brightness.light,
    primary: Color.fromARGB(255, 180, 184, 206), // Instagram Blue
    onPrimary: Colors.black,
    secondary: Color(0xFF5851DB), // Secondary Gradient Color
    onSecondary: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black,
    error: Colors.red,
    onError: Colors.white,
  );

  static const ColorScheme darkColorScheme = ColorScheme.dark(
    primary: Color(0xFFE1306C), // Instagram Pink/Red
    onPrimary: Colors.black, // Black text on the pink primary
    secondary: Color(0xFF405DE6), // Instagram Blue/Purple
    onSecondary: Colors.black, // Black text on the blue/purple secondary
    surface: Color(0xFF121212), // Dark gray background
    onSurface: Colors.white, // White text on dark surfaces
    error: Color(0xFFCF6679), // Lighter error red for dark mode
    onError: Colors.black,
    brightness: Brightness.dark,
  );

  static ThemeData lightTheme = ThemeData().copyWith(
    appBarTheme: AppBarTheme().copyWith(
      backgroundColor: Colors.white,
    ),
    iconTheme: IconThemeData().copyWith(
      color: Colors.black54,
    ),
    textTheme: TextTheme().copyWith(
      titleLarge: GoogleFonts.oleoScriptTextTheme().titleLarge!.copyWith(
            color: Colors.black,
          ),
      bodyLarge: TextStyle().copyWith(
        color: Colors.black,
      ),
      bodyMedium: TextStyle().copyWith(color: Colors.black),
      bodySmall: TextStyle().copyWith(color: Colors.black),
    ),
    colorScheme: lightColorScheme,
  );

  static ThemeData darkTheme = ThemeData().copyWith(
    colorScheme: darkColorScheme,
    textTheme: TextTheme().copyWith(
      titleLarge: GoogleFonts.oleoScriptTextTheme().titleLarge,
    ),
  );
}
