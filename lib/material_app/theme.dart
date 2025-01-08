import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'material_color.dart';


class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.lato(fontSize: 32, fontWeight: FontWeight.bold),
      headlineLarge:
          GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold),
      headlineMedium:
          GoogleFonts.lato(fontSize: 22, fontWeight: FontWeight.bold),
      headlineSmall:
          GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold),
      titleLarge: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
      titleMedium: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.bold),
      titleSmall: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.bold),
      bodyLarge: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.normal),
      bodyMedium: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.normal),
      bodySmall: GoogleFonts.lato(fontSize: 12, fontWeight: FontWeight.normal),
      labelLarge: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.bold),
      labelMedium:
          GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.normal),
      labelSmall: GoogleFonts.lato(fontSize: 10, fontWeight: FontWeight.normal),
    ),
    brightness: Brightness.light,
    primaryColor:
    MaterialColor(0xFFEC1C24, AppColors().color)



  );
}