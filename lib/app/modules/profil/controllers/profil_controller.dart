import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../models/akun.dart';

class ProfilController extends GetxController {
  var isLoading = true.obs;
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  var akun = Rx<Akun>(Akun(
    uid: '',
    docId: '',
    nama: '',
    noHP: '',
    email: '',
    role: '',
  ));

  Akun get currentAkun => akun.value;

  Future<void> getAkun() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
          .collection('akun')
          .where('uid', isEqualTo: _auth.currentUser!.uid)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var userData = querySnapshot.docs.first.data() as Map<String, dynamic>;

        akun(Akun(
          uid: userData['uid'],
          nama: userData['nama'],
          noHP: userData['noHP'],
          email: userData['email'],
          docId: userData['docId'],
          role: userData['role'],
        ));
      }
    } catch (e) {
      print('Error during HTTP request: $e');
    }
  }

  Future<void> Logout() async {
    await _auth.signOut();
    Get.offAllNamed("/login");
  }

  @override
  void onInit() {
    getAkun();
    update();
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
