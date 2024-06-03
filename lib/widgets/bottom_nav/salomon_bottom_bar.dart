// Importing necessary packages and widgets
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'bottom_nav_controller.dart';

// SalomonBottomBarWidget is a stateless widget that represents the bottom navigation bar of the application.
class SalomonBottomBarWidget extends StatelessWidget {
  // Constructor for SalomonBottomBarWidget. It takes an optional key.
  const SalomonBottomBarWidget({super.key});

  // The build method is called every time the widget needs to be rendered on the screen.
  // It returns a SalomonBottomBar widget with the current index and onTap function provided by the BottomNavController.
  @override
  Widget build(BuildContext context) {
    // An instance of BottomNavController is retrieved from the GetX dependency injection container.
    final BottomNavController controller = Get.find();

    return Obx(() => SalomonBottomBar(
          // The current index of the bottom navigation bar is bound to the selectedIndex observable of the controller.
          currentIndex: controller.selectedIndex.value,
          // The onTap function of the bottom navigation bar is set to the onItemTapped method of the controller.
          onTap: controller.onItemTapped,
          // The items of the bottom navigation bar.
          items: [
            SalomonBottomBarItem(
              icon: const Icon(MingCute.home_1_line),
              title: const Text("Home"),
              selectedColor: Colors.deepPurpleAccent[700],
            ),
            SalomonBottomBarItem(
              icon: const Icon(MingCute.search_line),
              title: const Text("Search"),
              selectedColor: Colors.deepPurpleAccent[700],
            ),
            SalomonBottomBarItem(
              icon: const Icon(MingCute.game_1_line),
              title: const Text('Games'),
              selectedColor: Colors.deepPurpleAccent[700],
            ),
            SalomonBottomBarItem(
              icon: const Icon(MingCute.user_3_line),
              title: const Text("Profile"),
              selectedColor: Colors.deepPurpleAccent[700],
            ),
          ],
        ));
  }
}
