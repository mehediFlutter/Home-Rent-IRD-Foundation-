import 'package:get/get.dart';

class DrawerGetxController extends GetxController {
  RxBool isDrawerOpen = false.obs;
  RxDouble xOffset = 0.0.obs;
  RxDouble yOffset = 0.0.obs;
  RxDouble scaleFactor = 1.0.obs;

  // drawer open function

  void openDrawer() {
    xOffset.value = 230;
    yOffset.value = 100;
    scaleFactor.value = 0.85;
    isDrawerOpen.value = true;
  }

  void closeDrawer() {

      xOffset.value = 0;
      yOffset.value = 0;
      scaleFactor.value = 1;
      isDrawerOpen.value = false;

  }
}
