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

    return GetBuilder<LoginController>(builder: (controller) {
      return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
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
                      height: 20,
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
                      height: 20,
                    ),
                    textAuth('Email'),
                    SizedBox(
                      height: 5,
                    ),
                    TextformfielAuth(
                      controller: controller.emailController,
                      onChanged: (value) {
                        return controller.emailController.text = value;
                      },
                      validator: (value) {
                        return controller.validateEmail(value!);
                      },
                      enable: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    textAuth('Password'),
                    SizedBox(
                      height: 5,
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
                      height: 40,
                    ),
                    ButtonAuth(
                      text: 'Login',
                      onPress: () {
                        controller.checkLogin();
                      },
                    ),
                    SizedBox(
                      height: 25,
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
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.offAllNamed("/register");
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
            ),
          ),
        ),
      );
    });
  }
}
