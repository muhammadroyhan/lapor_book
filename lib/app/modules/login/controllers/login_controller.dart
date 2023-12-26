import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> LoginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? validateEmail(String value) {
    if (value.isEmpty || value == ' ') {
      return 'Email tidak boleh kosong';
    }
    if (value.contains(' ') ||
        value.contains('  ') ||
        !value.contains('@') ||
        !value.contains('.') ||
        !GetUtils.isEmail(value)) {
      return 'Masukan email dengan benar';
    }
    {
      return null;
    }
  }

  String? validatePassword(String value) {
    if (value.isEmpty || value == ' ') {
      return 'Kata sandi tidak boleh kosong';
    }
    if (!GetUtils.isLengthGreaterThan(value, 7)) {
      return "Minimal 8 karakter";
    }
    if (value.contains(' ') ||
        value.contains('  ') ||
        !RegExp(r"^(?=.*[a-z])").hasMatch(value)) {
      return "Minimal 1 huruf kecil";
    }
    if (value.contains(' ') ||
        value.contains('  ') ||
        !RegExp(r"^(?=.*[A-Z])").hasMatch(value)) {
      return "Minimal 1 huruf Besar";
    }
    if (value.contains(' ') ||
        value.contains('  ') ||
        !RegExp(r"(?=.*[@$!%*?&])").hasMatch(value)) {
      return "Minimal 1 simbol";
    }
    {
      return null;
    }
  }

  Future<void> login() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      print('Login Successful');
      Get.offAllNamed("/home");
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
      );
    }
  }

  void checkLogin() async {
    if (LoginFormKey.currentState!.validate()) {
      LoginFormKey.currentState!.save();
      try {
        login();
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
