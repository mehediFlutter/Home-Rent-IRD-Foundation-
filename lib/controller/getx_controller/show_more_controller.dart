import 'package:get/get.dart';

class ShowMoreController extends GetxController {
  RxBool isExpanded = false.obs;
  changeIsExpanded(){
    isExpanded.value = ! isExpanded.value;
  }
}