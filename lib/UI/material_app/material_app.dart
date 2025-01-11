import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_rent/UI/material_app/theme/theme.dart';
import 'package:home_rent/UI/screens/drawer_screen/home_with_drawer.dart';
import '../../controller/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Home Rent IRD Foundation',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,

    home: HomeScreenWithDrawer(),
   
       getPages: Routes.pages
    );
  }
} 