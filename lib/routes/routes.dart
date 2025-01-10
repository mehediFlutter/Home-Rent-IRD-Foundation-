import 'package:get/get.dart';
import 'package:home_rent/UI/screens/details_screen/details_screen.dart';

import '../UI/screens/home_screen/home_screen.dart';

class Routes {
  static String home = '/';
  static String detailsScreen = '/details_screen';

  static List<GetPage> pages = [
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(
      name: detailsScreen,
      page: () => DetailsScreen(),
    ),
  ];
}
