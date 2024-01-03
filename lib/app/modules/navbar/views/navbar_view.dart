import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lapor_book/app/components/styles.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../controllers/navbar_controller.dart';

class NavbarView extends GetView<NavbarController> {
  const NavbarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavbarController>(builder: (controller) {
      return PersistentTabView(
        context,
        controller: controller.controllertab,
        screens: controller.buildScreens(),
        items: controller.navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: primaryColor,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style6,
      );
    });
  }
}
