import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:lapor_book/app/components/styles.dart';

import '../controllers/mylaporan_controller.dart';

class MylaporanView extends GetView<MylaporanController> {
  const MylaporanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MylaporanView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MylaporanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          Get.toNamed("/tambahlaporan");
        },
        child: Icon(
          FontAwesomeIcons.plus,
          color: Colors.white,
        ),
      ),
    );
  }
}
