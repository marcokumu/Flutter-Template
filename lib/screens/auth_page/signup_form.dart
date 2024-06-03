import 'package:flutter/material.dart';
import 'package:flutter_template/screens/auth_page/auth_screen_widgets.dart';
import 'package:flutter_template/screens/auth_page/signup_controller.dart';
import 'package:get/get.dart';

class SignUpForm extends StatelessWidget {
  final SignupController controller = Get.put(SignupController());
  final VoidCallback onLoginPressed;

  SignUpForm({required this.onLoginPressed, required ValueKey<String> key});

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
          Text('Welcome to Wezesha Chama!',
              style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          // The signup instruction.
          Text('Please sign up to continue',
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
          // A space between the password field and the signup button.
          const SizedBox(height: 20),
          // The signup button. It calls the signup method of the controller when pressed.
          // The button's loading state is bound to the isLoading observable of the controller.
          Obx(() => AuthButton(
              textInButton: Text('Sign Up'),
              onPressed: controller.signup,
              isLoading: controller.isLoading.value)),
          const SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Already have an account?',
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                )),
            TextButton(
              onPressed: () {
                onLoginPressed();
              },
              child: Text('Login',
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                  )),
            ),
          ]),
        ],
      ),
    );
  }
}
