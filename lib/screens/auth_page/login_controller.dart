// Importing necessary packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Importing AuthService from services
import '../../services/auth_service.dart';

// LoginController extends GetxController, which is a class provided by the GetX package for state management.
class LoginController extends GetxController {
  // Controllers for the email and password text fields.
  var emailController = TextEditingController();
  var passwordController = TextEditingController();


  // An observable boolean value to track whether a login operation is in progress.
  var isLoading = false.obs;

  // An instance of AuthService to handle authentication operations.
  final AuthService _authService;

  // Constructor for LoginController. It takes an optional AuthService instance.
  // If no AuthService is provided, a new instance is created.
  LoginController({AuthService? authService})
      : _authService = authService ?? AuthService();

  // The login method is called when the user presses the login button.
  // It performs the login operation using the AuthService instance.
  void login() async {
    // Set isLoading to true to indicate that a login operation is in progress.
    isLoading.value = true;

    // Get the email and password from the text field controllers.
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    try {
      // Attempt to login using the AuthService.
      await _authService.login(email, password);
      // Handle successful login (e.g., navigate to home screen)
      Get.toNamed('/bottom-nav');
    } catch (e) {
      // If an error occurs during login, show a snack bar with the error message.
      Get.snackbar('Error', e.toString());
    } finally {
      // Set isLoading to false to indicate that the login operation has finished.
      isLoading.value = false;
    }
  }
}
