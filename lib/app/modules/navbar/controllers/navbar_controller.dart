import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lapor_book/app/modules/home/views/home_view.dart';
import 'package:lapor_book/app/modules/mylaporan/views/mylaporan_view.dart';
import 'package:lapor_book/app/modules/profil/views/profil_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NavbarController extends GetxController {
   PersistentTabController controllertab =
      PersistentTabController(initialIndex: 0);

  List<Widget> buildScreens() {
    return [HomeView(), MylaporanView(), ProfilView()];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(
          FontAwesomeIcons.house,
          size: 24,
        ),
        activeColorPrimary: Colors.white,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          FontAwesomeIcons.bookOpen,
          size: 24,
        ),
        activeColorPrimary: Colors.white,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          FontAwesomeIcons.solidUser,
          size: 24,
        ),
        activeColorPrimary: Colors.white,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: Colors.white,
      ),
    ];
  }
}
