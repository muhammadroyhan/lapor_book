import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lapor_book/app/components/button.dart';
import 'package:lapor_book/app/components/styles.dart';
import 'package:lapor_book/app/models/akun.dart';

import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> {
  const ProfilView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    return GetBuilder<ProfilController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: MediaQueryHeight * 0.13,
                width: MediaQueryWidth,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: primaryColor),
                child: textHeader('Lapor Book'),
              ),
              Obx(() {
                Akun currentAkun = controller.currentAkun;
                return Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Text(
                        currentAkun.nama,
                        style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      ),
                      Text(
                        currentAkun.role,
                        style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: primaryColor),
                          ), // Sudut border
                        ),
                        child: Text(
                          currentAkun.noHP,
                          style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: primaryColor),
                          ), // Sudut border
                        ),
                        child: Text(
                          currentAkun.email,
                          style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: MediaQueryHeight * 0.02,
                      ),
                      ButtonAuth(
                        onPress: () {
                          controller.Logout();
                        },
                        text: 'Logout',
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      );
    });
  }
}
