import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:home_rent/controller/getx_controller/change_select_bottom_color.dart';
import 'package:home_rent/UI/screens/home_screen/home_screen_component.dart/near_from_you_item.dart';
import 'package:home_rent/controller/const/assets_path.dart';
import 'package:home_rent/UI/widgets/re_usable_bottom.dart/re_usable_bottom_with_svg_picture.dart';
import 'package:home_rent/UI/re_usable_base_screen.dart';
import 'package:home_rent/UI/widgets/re_usable_bottom.dart/re_usable_bottom_with_text.dart';
import 'package:home_rent/controller/getx_controller/drawer_controller.dart';

import '../../../controller/getx_controller/details_controller.dart';
import '../../../controller/getx_controller/search_controller.dart';
import '../../../controller/const/const.dart';
import '../../widgets/search_text_field/search_text_field.dart';
import '../../widgets/user_profile_banner.dart';
import 'home_screen_component.dart/best_for_you_item.dart';
import 'home_screen_component.dart/near_from_you_and_see_more.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ChangeSelectedBottomColor changeSelectedBottomColor =
      Get.put(ChangeSelectedBottomColor());

  GetxSearchController searchControllerGet = Get.put(GetxSearchController());
  DrawerGetxController drawerGetxController = Get.put(DrawerGetxController());
  final DetailsController detailsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ReUsableBaseScreen(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    SizedBox(
                      height: Get.height * 0.01,
                    ),

                    Row(
                      children: [
                        // Text Field
                        SearchTextField(
                          searchController:
                              searchControllerGet.searchController.value,
                        ),

                        // Filtered Bottom
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: BottomWithSVGPicture(
                            height: 48,
                            width: 48,
                            imagePath: filteredSVG,
                            isGradient: true,
                            onTap: () {
                              drawerGetxController.openDrawer();
                            },
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    SizedBox(
                      height: Get.height * 0.05,
                      child: ListView.builder(
                        itemCount: homeItem.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Obx(() {
                                return ReUsableBottomWithText(
                                  text: homeItem[index],
                                  isGradient: changeSelectedBottomColor
                                          .selectedIndex.value ==
                                      index,
                                  onTap: () {
                                    changeSelectedBottomColor
                                        .changeColor(index);
                                  },
                                );
                              }));
                        },
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    NearFromYouAndSeeMore(
                      text: 'Near from you',
                      seeMore: 'See More',
                    ),
                    SizedBox(
                      height: Get.height * 0.025,
                    ),

                    // Near From You item

                    SizedBox(
                      height: 272,
                      child: ListView.builder(
                        itemCount: itemList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          Map<String, String> indexItem = itemList[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: NearForYouItem(
                              item: indexItem,
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.025,
                    ),
                    NearFromYouAndSeeMore(
                      text: 'Best from you',
                      seeMore: 'See More',
                    ),
                    SizedBox(
                      height: Get.height * 0.025,
                    ),

                    // Best for you item
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: itemList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10, bottom: 15),
                          child: BestForYouItem(
                            imagePath: itemList[index]['image'],
                            title: itemList[index]['title'],
                            price: itemList[index]['price'],
                            bedRoom: itemList[index]['bed-room'],
                            bathRoom: itemList[index]['bath-room'],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
