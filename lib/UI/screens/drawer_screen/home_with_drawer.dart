import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_rent/UI/re_usable_base_screen.dart';
import 'package:home_rent/UI/screens/home_screen/home_screen.dart';

import '../../../controller/getx_controller/drawer_controller.dart';

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
              padding: EdgeInsets.only(left: 20, top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Menu",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  SizedBox(height: 20),
                  drawerItem(Icons.home, "Home"),
                ],
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

  Widget drawerItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.black),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
