import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_rent/material_app/theme.dart';

import '../screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Home Rent IRD Foundation',
      theme: AppTheme.lightTheme,
      home: HomeScreen(),
    );
  }
}
