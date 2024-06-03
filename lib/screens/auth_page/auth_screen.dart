// Importing necessary packages and files
import 'package:flutter/material.dart';
import 'package:flutter_template/screens/auth_page/signup_form.dart';

import 'login_form.dart'; // Import the login form

// This is the SignupScreen widget which is a StatefulWidget.
// StatefulWidget is a widget that can change over time.
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

// This is the private State class that goes with SignupScreen.
// It holds the mutable state for that widget.
class _AuthScreenState extends State<AuthScreen> {
  // This boolean variable is used to toggle between login and signup form
  bool _isLoginForm = true;

  // This function is used to toggle the _isLoginForm boolean value
  void _toggleForm() {
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
  }

  // This method describes the part of the user interface represented by the widget.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Setting a linear gradient background
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurpleAccent[700]!,
              Colors.deepPurpleAccent[100]!
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 700),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  // Defining the slide animation for the transition
                  var slideAnimation = Tween<Offset>(
                    begin: const Offset(1.0, 1.0),
                    end: const Offset(0.0, 0.0),
                  ).animate(CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeInOutCubicEmphasized));

                  return SlideTransition(
                    position: slideAnimation,
                    child: child,
                  );
                },
                // Depending on the _isLoginForm value, LoginForm or SignupForm is displayed
                child: _isLoginForm
                    ? LoginForm(
                        key: const ValueKey('LoginForm'),
                        onSignUpPressed: _toggleForm,
                      )
                    : SignUpForm(
                        key: const ValueKey('SignUpForm'),
                        onLoginPressed: _toggleForm,
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
