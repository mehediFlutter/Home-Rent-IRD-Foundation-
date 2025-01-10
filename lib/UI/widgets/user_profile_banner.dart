import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controller/const/assets_path.dart';
import '../../controller/getx_controller/drawer_controller.dart';

class UserProfileBanner extends StatelessWidget {
  final String name;
  final bool isNotified;
  final Function() locationTap;
  final Function() notificationTap;
  const UserProfileBanner({
    super.key,
    required this.name,
    this.isNotified = false,
    required this.locationTap,
    required this.notificationTap,
  });

  @override
  Widget build(BuildContext context) {
    DrawerGetxController drawerController = Get.put(DrawerGetxController());

    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: SizedBox(
        width: double.infinity,
        child: InkWell(
          onTap: () {
            drawerController.openDrawer();
          },
          child: Row(
            children: [
              Obx(() {
                return drawerController.isDrawerOpen.value
                    ? IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () {
                          drawerController.closeDrawer();
                        },
                      )
                    : SizedBox
                        .shrink(); // Use SizedBox.shrink() to remove the leading space
              }),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        name,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 15),
                        child: InkWell(
                          onTap: () {
                            locationTap();
                          },
                          child: Transform.rotate(
                            angle: 90 *
                                3.1415926535897932 /
                                180, // 90 degrees in radians
                            child:
                                Icon(Icons.arrow_forward_ios_outlined, size: 13),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(), // Use Spacer to take up remaining space
              InkWell(
                onTap: () {
                  notificationTap();
                },
                child: Stack(
                  children: [
                    SvgPicture.asset(notificationSVG),
                    isNotified
                        ? Positioned(
                            right: 0,
                            child: Container(
                              margin: EdgeInsets.only(bottom: 5),
                              height: 9,
                              width: 9,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0XFFFA0E0E)),
                            ),
                          )
                        : SizedBox()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
