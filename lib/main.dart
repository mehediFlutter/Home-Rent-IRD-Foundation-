import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_rent/UI/material_app/material_app.dart';
import 'controller/getx_controller/details_controller.dart';

void main() {
  Get.put(DetailsController());
  runApp(MyApp());
}
