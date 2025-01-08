import 'package:flutter/material.dart';
import 'package:home_rent/material_app/material_color.dart';

class AppInputDecorationTheme {
  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: MaterialColor(0xFFEC1C24, AppColors().color),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: MaterialColor(0xFFEC1C24, AppColors().color),
      ),
    ),
  );
}
