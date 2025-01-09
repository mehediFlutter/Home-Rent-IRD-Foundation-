import 'package:get/get.dart';
import 'package:home_rent/screens/near_from_you_details/details_screen.dart';

import '../screens/home_screen/home_screen.dart';

class Routes {
  static String home            = '/';
  static String detailsScreen   = '/details_screen';

  static List<GetPage> pages = [
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: detailsScreen, page: () => DetailsScreen()),
  ];
}
