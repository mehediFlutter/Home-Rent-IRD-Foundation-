import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:home_rent/screens/home_screen/near_from_you_item.dart';
import 'package:home_rent/widgets/assets_path.dart';
import 'package:home_rent/widgets/re_usable_bottom.dart/re_usable_bottom_with_svg_picture.dart';
import 'package:home_rent/widgets/re_usable_base_screen.dart';
import 'package:home_rent/widgets/re_usable_bottom.dart/re_usable_bottom_with_text.dart';

import '../../widgets/const.dart';
import '../../widgets/search_text_field/search_text_field.dart';
import '../../widgets/user_profile_banner.dart';
import 'best_for_you_item.dart';
import 'near_from_you_and_see_more.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  List<String> homeItem = [
    ' House ',
    ' Apartment ',
    ' Hotel ',
    ' Villa ',
    ' Condo ',
    ' Cottage ',
    ' Bungalow ',
    ' Duplex ',
    ' Loft '
  ];
    int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return ReUsableBaseScreen(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
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
                    searchController: searchController,
                  ),

                  // Filtered Bottom
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: BottomWithSVGPicture(
                      height: 48,
                      width: 48,
                      imagePath: filteredSVG,
                      isGradient: true,
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
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ReUsableBottomWithText(
                        text: homeItem[index],
                        isGradient:  selectedIndex == index,
                         onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },

                        ),
                    );
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
              SizedBox(
                height: 272,
                child: ListView.builder(
                  itemCount: nearFromYouItemList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: NearForYouItem(
                        imagePath: nearFromYouItemList[index]['image'],
                        title: nearFromYouItemList[index]['title'],
                        subTitle: nearFromYouItemList[index]['sub-title'],
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
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: bestForYouItemList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10, bottom: 15),
                    child: BestForYouItem(
                      imagePath: bestForYouItemList[index]['image'],
                      title: bestForYouItemList[index]['title'],
                      price: bestForYouItemList[index]['price'],
                      bedRoom: bestForYouItemList[index]['bed-room'],
                      bathRoom: bestForYouItemList[index]['bath-room'],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
