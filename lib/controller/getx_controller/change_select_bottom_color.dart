import 'package:get/get.dart';

class ChangeSelectedBottomColor extends GetxController {
  RxInt selectedIndex = (-1).obs;

  changeColor(int value){
    selectedIndex.value = value;
  }
}
