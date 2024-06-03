// Importing necessary packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/auth_service.dart';

// SignupController is a controller class for the signup screen.
// It extends GetxController, which is a class provided by the GetX package for state management.
class SignupController extends GetxController {
  // Controllers for the email and password text fields.
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  // An observable boolean value to track whether a signup operation is in progress.
  var isLoading = false.obs;

  // An instance of AuthService to handle authentication operations.
  final AuthService _authService;

  // Constructor for SignupController. It takes an optional AuthService instance.
  // If no AuthService is provided, a new instance is created.
  SignupController({AuthService? authService})
      : _authService = authService ?? AuthService();

  // The signup method is called when the user presses the signup button.
  // It performs the signup operation using the AuthService instance.
  void signup() async {
    // Set isLoading to true to indicate that a signup operation is in progress.
    isLoading.value = true;

    // Get the email and password from the text field controllers.
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    try {
      // Attempt to sign up using the AuthService.
      await _authService.signup(email, password);
      // Handle successful signup (e.g., navigate to home screen)
      Get.toNamed('/bottom-nav');
    } catch (e) {
      // If an error occurs during signup, show a snack bar with the error message.
      Get.snackbar('Error', e.toString());
    } finally {
      // Set isLoading to false to indicate that the signup operation has finished.
      isLoading.value = false;
    }
  }
}
