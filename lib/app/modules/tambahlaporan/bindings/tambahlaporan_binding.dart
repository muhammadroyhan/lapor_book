import 'package:get/get.dart';

import '../controllers/tambahlaporan_controller.dart';

class TambahlaporanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahlaporanController>(
      () => TambahlaporanController(),
    );
  }
}
