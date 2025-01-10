import 'package:get/get.dart';
import 'package:flutter/material.dart';

class GalleryController extends GetxController {
  var maxVisibleItems = 0.obs;
  final ScrollController scrollController = ScrollController();

  void calculateVisibleItems(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth = 72 + 10; // Image width + padding
    maxVisibleItems.value = (screenWidth / itemWidth).floor();
  }
}