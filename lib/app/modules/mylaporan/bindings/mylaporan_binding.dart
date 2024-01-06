import 'package:get/get.dart';

import '../controllers/mylaporan_controller.dart';

class MylaporanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MylaporanController>(
      () => MylaporanController(),
    );
  }
}
