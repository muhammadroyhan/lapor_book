import 'package:get/get.dart';
import 'package:lapor_book/app/modules/home/controllers/home_controller.dart';
import 'package:lapor_book/app/modules/mylaporan/controllers/mylaporan_controller.dart';
import 'package:lapor_book/app/modules/profil/controllers/profil_controller.dart';

import '../controllers/navbar_controller.dart';

class NavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavbarController>(
      () => NavbarController(),
    );
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => MylaporanController());
    Get.lazyPut(() => ProfilController());
  }
}
