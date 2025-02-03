import 'package:get/get.dart';

class DrawerGetxController extends GetxController {
  RxBool isDrawerOpen       = false.obs;
  RxDouble xOffset          = 0.0.obs;
  RxDouble yOffset          = 0.0.obs;
  RxDouble scaleFactor      = 1.0.obs;

  // Drawer Item verbile
  RxBool isHomeTap            = true.obs;
  RxBool isProfileTap         = false.obs;
  RxBool isNearbyTap          = false.obs;
  RxBool isBookmarkTap        = false.obs;
  RxBool isNotificationTap    = false.obs;
  RxBool isMessageTap         = false.obs;
  RxBool isSettingTap         = false.obs;
  RxBool isHelpTap            = false.obs;
  RxBool isLogOutTap          = false.obs;

  changeBool(RxBool value) {
    value.value = !value.value;
  }

  void setActiveItem(RxBool selectedTab) {
    isHomeTap.value             = false;
    isProfileTap.value          = false;
    isNearbyTap.value           = false;
    isBookmarkTap.value         = false;
    isNotificationTap.value     = false;
    isMessageTap.value          = false;
    isSettingTap.value          = false;
    isHelpTap.value             = false;
    isLogOutTap.value           = false;
    selectedTab.value           = true;
  }

  // drawer open function
  void openDrawer() {
    xOffset.value       = 230;
    yOffset.value       = 50;
    scaleFactor.value   = 0.87;
    isDrawerOpen.value  = true;
  }

  void closeDrawer() {
    xOffset.value       = 0;
    yOffset.value       = 0;
    scaleFactor.value   = 1;
    isDrawerOpen.value  = false;
  }

  // drawer item variable


}
