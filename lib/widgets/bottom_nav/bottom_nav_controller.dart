// Importing necessary packages
import 'package:get/get.dart';

// BottomNavController is a controller class for the bottom navigation bar.
// It extends GetxController, which is a class provided by the GetX package for state management.
class BottomNavController extends GetxController {
  // An observable integer value to track the currently selected index of the bottom navigation bar.
  var selectedIndex = 0.obs;

  // The onItemTapped method is called when a navigation item is tapped.
  // It updates the selectedIndex observable with the index of the tapped item.
  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
