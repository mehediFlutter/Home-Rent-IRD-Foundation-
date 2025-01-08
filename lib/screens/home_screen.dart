import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_rent/widgets/re_usable_bottom.dart/bottom_with_svg_picture.dart';
import 'package:home_rent/widgets/re_usable_base_screen.dart';

import '../widgets/const.dart';
import '../widgets/user_profile_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ReUsableBaseScreen(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          children: [
            // Re-Usable User Profile Banner

            //-------- advantage of this Re-Usable Widget ---------
            // You can pass here location tap function (tap on drop-down icon),
            // You can also pass here notification tap function
            // here set a bool for notification toggle
            // if isNotified == true, then show red toggle top-right of notification

            UserProfileBanner(
              name: 'Jakarta',
              isNotified: true,
              locationTap: () {
                if (kDebugMode) {
                  print(aboutJakarta);
                }
              },
              notificationTap: () {
                if (kDebugMode) {
                  print("Notification Tap");
                }
              },
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: BottomWithSVGPicture(
                    height: 48,
                    width: 48,
                    imagePath: 'assets/icons/filter.svg',
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

