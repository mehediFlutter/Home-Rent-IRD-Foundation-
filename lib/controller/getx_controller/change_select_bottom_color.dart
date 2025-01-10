import 'package:get/get.dart';

class ChangeSelectedBottomColor extends GetxController {
  RxInt selectedIndex = 0.obs;

  changeColor(int value){
    selectedIndex.value = value;
  }
}
