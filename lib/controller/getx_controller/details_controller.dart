import 'package:get/get.dart';

class DetailsController extends GetxController {
  RxString imagePath = ''.obs;
  RxString title = ''.obs;
  RxString subTitle = ''.obs;
  RxString bedRoom = ''.obs;
  RxString bathRoom = ''.obs;

  void setDetails(String imagePath, String title, String subTitle, String bedRoom, String bathRoom) {
    this.imagePath.value = imagePath;
    this.title.value = title;
    this.subTitle.value = subTitle;
    this.bedRoom.value = bedRoom;
    this.bathRoom.value = bathRoom;
  }
}