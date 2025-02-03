import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_rent/UI/screens/drawer_screen/drawer_component/drawer_const.dart';
import 'package:home_rent/getx_controller/const/const.dart';
import '../../../../getx_controller/getx_controller/drawer_controller.dart';

class DrawerItem extends StatelessWidget {
  final String text;
  final String iconPath;
  final RxBool boolValue;
  final bool isNotified;
  final Function()? onTap;
  final DrawerGetxController drawerController;

  const DrawerItem({
    super.key,
    required this.drawerController,
    this.onTap,
    required this.text,
    required this.iconPath,
    required this.boolValue,
    this.isNotified = false,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => InkWell(
          borderRadius: drawerItemBorderRadius(),
          onTap: onTap,
          child: Container(
            height: 40,
            width: 170,
            decoration: BoxDecoration(
              color: boolValue.value ? Colors.white : Colors.transparent,
              borderRadius: drawerItemBorderRadius(),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                width15,
                Stack(
                  children: [
                    SvgPicture.asset(
                      iconPath,
                      colorFilter: boolValue.value
                          ? ColorFilter.mode(Colors.blue, BlendMode.srcIn)
                          : ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                    isNotified
                  ? Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        height: 7,
                        width: 7,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.redAccent,
                        ),
                      ),
                    )
                  : SizedBox(),
                  ],
                ),
                width20,
                Text(
                  text,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: boolValue.value ? Colors.blue : Colors.white),
                ),
              ],
            ),
          ),
        ));
  }
}
