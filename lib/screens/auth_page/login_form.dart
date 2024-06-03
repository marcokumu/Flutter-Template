import 'package:flutter/material.dart';
import 'package:flutter_template/screens/auth_page/auth_screen_widgets.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginForm extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());
  final VoidCallback onSignUpPressed;

  LoginForm({required this.onSignUpPressed, required ValueKey<String> key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // The logo of the application.
          SizedBox(
              width: screenWidth * 0.5,
              height: screenWidth * 0.5,
              child: Image.asset('assets/images/wezesha_logo.png')),

          // The welcome message.
          Text('Welcome back to Wezesha Chama!',
              style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          // The login instruction.
          Text('Please log in to continue',
              style: TextStyle(
                  fontSize: screenWidth * 0.035, color: Colors.black)),
          // A space between the instruction and the email field.
          const SizedBox(height: 20),
          // The email text field.
          AuthTextField(
              controller: controller.emailController, labelText: 'Email'),
          // A space between the email field and the password field.
          const SizedBox(height: 10),
          // The password text field.
          AuthTextField(
              controller: controller.passwordController,
              labelText: 'Password',
              isPassword: true),
          // A space between the password field and the login button.
          const SizedBox(height: 20),
          // The login button. It calls the login method of the controller when pressed.
          // The button's loading state is bound to the isLoading observable of the controller.
          Obx(() => AuthButton(
              textInButton: const Text('Login'),
              onPressed: controller.login,
              isLoading: controller.isLoading.value)),
          const SizedBox(height: 10),
          // The new text
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('New to Wezesha Chama?',
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                  )),
              TextButton(
                onPressed: () {
                  onSignUpPressed();
                },
                child: Text('Sign Up',
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
