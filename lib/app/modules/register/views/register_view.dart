import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lapor_book/app/components/button.dart';
import 'package:lapor_book/app/components/styles.dart';
import 'package:lapor_book/app/components/textformfield.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<RegisterController>(
            builder: ((controller) {
              return Container(
                // color: Colors.amber,
                height: MediaQueryHeight * 1.1,
                width: MediaQueryWidth,
                padding: EdgeInsets.only(right: 30, left: 30, top: 30),
                child: Form(
                  key: controller.RegisterFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: textHeader('Register')),
                      SizedBox(
                        height: MediaQueryHeight * 0.02,
                      ),
                      Center(
                        child: Text(
                          'Create your profile to start your journey',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.black26,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQueryHeight * 0.03,
                      ),
                      textAuth('Nama'),
                      SizedBox(
                        height: MediaQueryHeight * 0.01,
                      ),
                      TextformfielAuth(
                        controller: controller.namaController,
                        onChanged: (value) {
                          return controller.namaController.text = value;
                        },
                        validator: (value) {
                          return controller.validateNama(value!);
                        },
                        obscureText: false,
                        enable: true,
                      ),
                      SizedBox(
                        height: MediaQueryHeight * 0.02,
                      ),
                      textAuth('Email'),
                      SizedBox(
                        height: MediaQueryHeight * 0.01,
                      ),
                      TextformfielAuth(
                        controller: controller.emailController,
                        onChanged: (value) {
                          return controller.emailController.text = value;
                        },
                        validator: (value) {
                          return controller.validateEmail(value!);
                        },
                        obscureText: false,
                        enable: true,
                      ),
                      SizedBox(
                        height: MediaQueryHeight * 0.02,
                      ),
                      textAuth('No Handphone'),
                      SizedBox(
                        height: MediaQueryHeight * 0.01,
                      ),
                      TextformfielHP(
                        controller: controller.nohpController,
                        onChanged: (value) {
                          return controller.nohpController.text = value;
                        },
                        validator: (value) {
                          return controller.validateNomorHp(value!);
                        },
                        obscureText: false,
                        enable: true,
                      ),
                      SizedBox(
                        height: MediaQueryHeight * 0.02,
                      ),
                      textAuth('Password'),
                      SizedBox(
                        height: MediaQueryHeight * 0.01,
                      ),
                      TextformfielPassword(
                        controller: controller.passwordController,
                        onChanged: (value) {
                          return controller.passwordController.text = value;
                        },
                        validator: (value) {
                          return controller.validatePassword(value!);
                        },
                        obscureText: true,
                        enable: true,
                      ),
                      SizedBox(
                        height: MediaQueryHeight * 0.02,
                      ),
                      textAuth('Confirmation Password'),
                      SizedBox(
                        height: MediaQueryHeight * 0.01,
                      ),
                      TextformfielPassword(
                        controller: controller.passwordController,
                        onChanged: (value) {
                          return controller.passwordController.text = value;
                        },
                        validator: (value) {
                          return controller.validateKonfirmPassword(value!);
                        },
                        obscureText: true,
                        enable: true,
                      ),
                      SizedBox(
                        height: MediaQueryHeight * 0.04,
                      ),
                      ButtonAuth(
                        text: 'Register',
                        onPress: () {
                          controller.checkRegister();
                        },
                      ),
                      SizedBox(
                        height: MediaQueryHeight * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Already gave an account?',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            width: MediaQueryWidth * 0.02,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed("/login");
                            },
                            child: Text(
                              'Login',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
