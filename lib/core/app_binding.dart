import 'package:get/get.dart';
import 'package:igreja_izau/controller/left_bar_controller.dart';
import 'package:igreja_izau/controller/listar_member_controller.dart';
import 'package:igreja_izau/controller/member_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LeftBarController>(LeftBarController());
    Get.lazyPut<MemberController>(() => MemberController());
    Get.lazyPut<ListarMembroController>(() => ListarMembroController());
  }
}
