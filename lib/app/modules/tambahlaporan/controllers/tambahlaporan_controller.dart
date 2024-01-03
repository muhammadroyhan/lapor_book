import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TambahlaporanController extends GetxController {
  //TODO: Implement TambahlaporanController

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;
  TextEditingController JudulLaporanCtrl = TextEditingController();
  TextEditingController InstansiCtrl = TextEditingController();
  TextEditingController DeskripsiCtrl = TextEditingController();

  var instansi = ''.obs;

  String? validateJudul(String value) {
    if (value.isEmpty || value == ' ') {
      return 'Judul tidak boleh kosong';
    }
    return null;
  }

  ImagePicker _picker = ImagePicker();
  XFile? file;

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
