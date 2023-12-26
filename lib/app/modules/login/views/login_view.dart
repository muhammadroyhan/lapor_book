import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lapor_book/app/components/button.dart';
import 'package:lapor_book/app/components/styles.dart';
import 'package:lapor_book/app/components/textformfield.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: GetBuilder<LoginController>(
            builder: (controller) {
              return Container(
                height: MediaQueryHeight,
                width: MediaQueryWidth,
                padding: EdgeInsets.only(right: 30, left: 30, top: 30),
                child: Form(
                  key: controller.LoginFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: textHeader('Login')),
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
                        height: MediaQueryHeight * 0.04,
                      ),
                      ButtonAuth(
                        text: 'Login',
                        onPress: () {
                          controller.checkLogin();
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
                              Get.toNamed("/register");
                            },
                            child: Text(
                              'Register',
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
            },
          ),
        ),
      ),
    );
  }
}
