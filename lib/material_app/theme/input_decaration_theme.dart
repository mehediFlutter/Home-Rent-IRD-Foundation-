import 'package:flutter/material.dart';

import '../../widgets/const.dart';

class AppInputDecorationTheme {
  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: textFieldFillColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    
  );
}
