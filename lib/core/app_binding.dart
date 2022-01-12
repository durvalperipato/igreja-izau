import 'package:get/get.dart';
import 'package:igreja_izau/controller/left_bar_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LeftBarController>(LeftBarController());
  }
}
