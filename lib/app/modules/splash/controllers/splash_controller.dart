import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(milliseconds: 1800), () {
      Get.offAllNamed("/register");
    });
  }

  @override
  void onReady() {
    // Future.delayed(Duration(milliseconds: 500), () {
    //   Get.offNamed("/register");
    // });
    // super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
