import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_rent/UI/re_usable_base_screen.dart';
import 'package:home_rent/UI/screens/home_screen/home_screen.dart';
import 'package:home_rent/controller/const/assets_path.dart';

import '../../../controller/getx_controller/drawer_controller.dart';
import 'drawer_component/drawer_item.dart';

class HomeScreenWithDrawer extends StatefulWidget {
  const HomeScreenWithDrawer({super.key});

  @override
  HomeScreenWithDrawerState createState() => HomeScreenWithDrawerState();
}

class HomeScreenWithDrawerState extends State<HomeScreenWithDrawer> {
  DrawerGetxController drawerController = Get.put(DrawerGetxController());

  @override
  Widget build(BuildContext context) {
    return ReUsableBaseScreen(
      child: Stack(
        children: [
          // Drawer Menu
          Scaffold(
            backgroundColor: Color(0XFF0A8ED9),
            body: Container(
              padding: EdgeInsets.only(top: Get.height * 0.14),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DrawerItem(
                      drawerController: drawerController,
                      text: 'Home',
                      iconPath: drawerHomeSVG,
                      boolValue: drawerController.isHomeTap,
                      onTap: () {
                        drawerController
                            .setActiveItem(drawerController.isHomeTap);
                        drawerController.closeDrawer();
                      },
                    ),
                    drawerItemHeight,
                    DrawerItem(
                      drawerController: drawerController,
                      text: 'Profile',
                      iconPath: drawerProfileSVG,
                      boolValue: drawerController.isProfileTap,
                      onTap: () {
                        drawerController
                            .setActiveItem(drawerController.isProfileTap);
                        drawerController.closeDrawer();
                      },
                    ),
                    drawerItemHeight,
                    DrawerItem(
                      drawerController: drawerController,
                      text: 'Nearby',
                      iconPath: drawerLocationSVG,
                      boolValue: drawerController.isNearbyTap,
                      onTap: () {
                        drawerController
                            .setActiveItem(drawerController.isNearbyTap);
                        drawerController.closeDrawer();
                      },
                    ),
                    drawerItemHeight,
                    line,
                    drawerItemHeight,
                    DrawerItem(
                      drawerController: drawerController,
                      text: 'Bookmark',
                      iconPath: saveIconSVG,
                      boolValue: drawerController.isBookmarkTap,
                      onTap: () {
                        drawerController
                            .setActiveItem(drawerController.isBookmarkTap);
                        drawerController.closeDrawer();
                      },
                    ),
                    drawerItemHeight,
                    DrawerItem(
                      drawerController: drawerController,
                      text: 'Notification',
                      iconPath: drawerNotificationSVG,
                      boolValue: drawerController.isNotificationTap,
                      isNotified: true,
                      onTap: () {
                        drawerController
                            .setActiveItem(drawerController.isNotificationTap);
                        drawerController.closeDrawer();
                      },
                    ),
                    drawerItemHeight,
                    DrawerItem(
                      drawerController: drawerController,
                      text: 'Message',
                      iconPath: drawerMessageSVG,
                      boolValue: drawerController.isMessageTap,
                      isNotified: true,
                      onTap: () {
                        drawerController
                            .setActiveItem(drawerController.isMessageTap);
                        drawerController.closeDrawer();
                      },
                    ),
                    drawerItemHeight,
                    line,
                    drawerItemHeight,
                    DrawerItem(
                      drawerController: drawerController,
                      text: 'Settings',
                      iconPath: drawerSettingSVG,
                      boolValue: drawerController.isSettingTap,
                      onTap: () {
                        drawerController
                            .setActiveItem(drawerController.isSettingTap);
                        drawerController.closeDrawer();
                      },
                    ),
                    drawerItemHeight,
                    DrawerItem(
                      drawerController: drawerController,
                      text: 'Help',
                      iconPath: drawerHelpSVG,
                      boolValue: drawerController.isHelpTap,
                      onTap: () {
                        drawerController
                            .setActiveItem(drawerController.isHelpTap);
                        drawerController.closeDrawer();
                      },
                    ),
                    drawerItemHeight,
                    DrawerItem(
                      drawerController: drawerController,
                      text: 'Logout',
                      iconPath: drawerLogOutSVG,
                      boolValue: drawerController.isLogOutTap,
                      onTap: () {
                        drawerController
                            .setActiveItem(drawerController.isLogOutTap);
                        drawerController.closeDrawer();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
      
          // Main Content with Animation
          Obx(() {
            return AnimatedContainer(
              transform: Matrix4.translationValues(
                  drawerController.xOffset.value,
                  drawerController.yOffset.value,
                  0)
                ..scale(drawerController.scaleFactor.value),
              duration: Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: drawerController.isDrawerOpen.value
                    ? BorderRadius.circular(30)
                    : BorderRadius.zero,
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      drawerController.isDrawerOpen.value ? 30 : 0),
                  child: HomeScreen()),
            );
          })
        ],
      ),
    );
  }

  Container line = Container(
    width: 168,
    height: 1,
    color: Color(0XFF84C7EC),
  );

  SizedBox drawerItemHeight = SizedBox(
    height: Get.height * 0.016,
  );
}
