import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(milliseconds: 500), () {
      Get.offAllNamed("/home");
    });
  }

  @override
  void onReady() {
    Future.delayed(Duration(milliseconds: 500), () {
      Get.offNamed("/home");
    });
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
