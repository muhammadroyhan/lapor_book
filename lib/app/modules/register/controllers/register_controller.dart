import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final GlobalKey<FormState> RegisterFormKey = GlobalKey<FormState>();

  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nohpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? validateNama(String value) {
    if (value.isEmpty || value == ' ') {
      return 'Nama tidak boleh kosong';
    }
    if (value.length >= 25) {
      return 'Teks tidak boleh lebih dari 25 karakter';
    }
    if (!RegExp(r'^[a-zA-Z\s.]+$').hasMatch(value)) {
      return 'Teks hanya boleh mengandung huruf, spasi, dan titik';
    }
    return null;
  }

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

  String? validateNomorHp(String value) {
    if (value == ' ') {
      return 'Nomor Handpone tidak boleh kosong';
    }
    if (!GetUtils.isLengthGreaterThan(value, 11)) {
      return "Nomor HP tidak boleh lebih dari 12 angka";
    }
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'Nomor HP hanya boleh mengandung angka';
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

  String? validateKonfirmPassword(String value) {
    if (value.isEmpty || value == ' ') {
      return 'Masukan kembali kata sandi';
    }
    if (value != passwordController.text) {
      return "Kata sandi tidak sama";
    }
    return null;
  }

  Future<void> register() async {
    try {
      CollectionReference akunCollection = firestore.collection('akun');

      await _auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      final docId = akunCollection.doc().id;
      await akunCollection.doc(docId).set({
        'uid': _auth.currentUser!.uid,
        'nama': namaController.text,
        'email': emailController.text,
        'noHP': nohpController.text,
        'docId': docId,
        'role': 'user',
      });
      print(docId);
      Get.toNamed("/login");
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
      );
    }
  }

  void checkRegister() async {
    if (RegisterFormKey.currentState!.validate()) {
      RegisterFormKey.currentState!.save();
      try {
        register();
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
