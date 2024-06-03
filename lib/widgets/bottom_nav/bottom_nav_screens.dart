// Importing necessary packages and screens
import 'package:flutter/material.dart';
import 'package:flutter_template/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_template/screens/games/games_screen.dart';
import 'package:flutter_template/screens/profile/profile_screen.dart';
import 'package:get/get.dart';

import '../../screens/search/search_screen.dart';
import 'bottom_nav_controller.dart';
import 'salomon_bottom_bar.dart';

// BottomNavScreens is a stateless widget that represents the screen with the bottom navigation bar.
class BottomNavScreens extends StatelessWidget {
  // Constructor for BottomNavScreens. It takes an optional key.
  const BottomNavScreens({super.key});

  // The build method is called every time the widget needs to be rendered on the screen.
  // It returns a Scaffold widget with an IndexedStack for switching between screens and a SalomonBottomBarWidget for the bottom navigation bar.
  @override
  Widget build(BuildContext context) {
    // An instance of BottomNavController is created and stored in the GetX dependency injection container.
    final BottomNavController controller = Get.put(BottomNavController());

    // The list of screens that can be navigated to using the bottom navigation bar.
    final screens = [
      const DashboardScreen(),
      const SearchScreen(),
      const GamesScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      // The body of the Scaffold is an IndexedStack that displays the screen corresponding to the currently selected index of the bottom navigation bar.
      body: Obx(() => IndexedStack(
            index: controller.selectedIndex.value,
            children: screens,
          )),
      // The bottom navigation bar is a SalomonBottomBarWidget.
      bottomNavigationBar: const SalomonBottomBarWidget(),
    );
  }
}
