import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../material_color.dart';
import 'input_decaration_theme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    textTheme: TextTheme(
      displayLarge:
          GoogleFonts.raleway(fontSize: 32, fontWeight: FontWeight.bold),
      headlineLarge:
          GoogleFonts.raleway(fontSize: 24, fontWeight: FontWeight.bold),
      headlineMedium:
          GoogleFonts.raleway(fontSize: 22, fontWeight: FontWeight.bold),
      headlineSmall:
          GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.bold),
      titleLarge:
          GoogleFonts.raleway(fontSize: 18, fontWeight: FontWeight.bold),
      titleMedium:
          GoogleFonts.raleway(fontSize: 16, fontWeight: FontWeight.w500),
      titleSmall:
          GoogleFonts.raleway(fontSize: 14, fontWeight: FontWeight.bold),
      bodyLarge:
          GoogleFonts.raleway(fontSize: 16, fontWeight: FontWeight.normal),
      bodyMedium:
          GoogleFonts.raleway(fontSize: 14, fontWeight: FontWeight.normal),
      bodySmall: GoogleFonts.raleway(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xFF838383)),
      labelLarge:
          GoogleFonts.raleway(fontSize: 16, fontWeight: FontWeight.bold),
      labelMedium:
          GoogleFonts.raleway(fontSize: 14, fontWeight: FontWeight.normal),
      labelSmall:
          GoogleFonts.raleway(fontSize: 10, fontWeight: FontWeight.normal),
    ),
    brightness: Brightness.light,
    primaryColor: MaterialColor(0xFFEC1C24, AppColors().color),
    inputDecorationTheme: AppInputDecorationTheme.inputDecorationTheme,
  );
}

