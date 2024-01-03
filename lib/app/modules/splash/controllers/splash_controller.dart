import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> checkUser() async {
    User? user = _auth.currentUser;

    if (user != null) {
      Future.delayed(Duration(milliseconds: 1800), () {
        Get.offAllNamed("/navbar");
      });
    } else {
      Future.delayed(Duration(milliseconds: 1800), () {
        Get.offAllNamed("/login");
      });
    }
  }

  @override
  void onInit() {
    checkUser();
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {
    super.onClose();
  }
}
