import 'package:flutter/animation.dart';
import 'package:flutter_template/screens/auth_page/auth_screen.dart';
import 'package:flutter_template/screens/confirmation/confirmation_page.dart';
import 'package:flutter_template/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_template/screens/games/games_screen.dart';
import 'package:flutter_template/screens/profile/profile_screen.dart';
import 'package:flutter_template/screens/search/search_screen.dart';
import 'package:flutter_template/widgets/bottom_nav/bottom_nav_screens.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/dashboard', page: () => const DashboardScreen()),
    GetPage(name: '/search', page: () => const SearchScreen()),
    GetPage(name: '/profile', page: () => const ProfileScreen()),
    GetPage(
        name: '/bottom-nav',
        page: () => const BottomNavScreens(),
        transition: Transition.fadeIn,
        curve: Curves.easeInOutCubic,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(name: '/games', page: () => const GamesScreen()),
    GetPage(name: '/signup', page: () => const AuthScreen()),
    GetPage(
        name: '/confirmation',
        page: () => const ConfirmationPage(
              isSuccess: true,
            ),
        transition: Transition.downToUp)
  ];
}
