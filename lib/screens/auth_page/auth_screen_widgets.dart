// A stateless widget for creating a text field in the signup screen.
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class AuthTextField extends StatelessWidget {
  // The controller for the text field.
  final TextEditingController controller;
  // The label text for the text field.
  final String labelText;
  // A boolean value to determine if the text field is for password input.
  final bool isPassword;

  // Constructor for SignupTextField. It takes a controller, a label text, and an optional boolean for password input.
  const AuthTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.isPassword = false,
  });

  // The build method is called every time the widget needs to be rendered on the screen.
  // It returns a TextField widget with the provided controller, label text, and password input option.
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: isPassword
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
        showCursor: true,
        decoration: InputDecoration(
          prefixIcon: isPassword
              ? const Icon(MingCute.lock_line)
              : const Icon(MingCute.mail_line),
          labelText: labelText,
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        ),
      ),
    );
  }
}

// A stateless widget for creating a button in the signup screen.
class AuthButton extends StatelessWidget {
  // The function to be called when the button is pressed.
  final VoidCallback onPressed;
  // A boolean value to determine if the button is in a loading state.
  final bool isLoading;
  // A text to be displayed in the button
  final Widget textInButton;

  // Constructor for SignupButton. It takes a function for button press and a boolean for loading state.
  const AuthButton(
      {super.key,
      required this.onPressed,
      required this.isLoading,
      required this.textInButton});

  // The build method is called every time the widget needs to be rendered on the screen.
  // It returns an ElevatedButton widget with the provided onPressed function and loading state.
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: FilledButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: isLoading ? const CircularProgressIndicator() : textInButton,
      ),
    );
  }
}
