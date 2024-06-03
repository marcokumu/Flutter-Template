// test/screens/signup/signup_screen_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_template/screens/auth_page/auth_screen.dart';
import 'package:flutter_template/screens/auth_page/signup_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('SignupScreen UI test', (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: AuthScreen(),
      ),
    );

    final emailField = find.byType(TextField).first;
    final passwordField = find.byType(TextField).last;
    final signupButton = find.byType(ElevatedButton);

    expect(emailField, findsOneWidget);
    expect(passwordField, findsOneWidget);
    expect(signupButton, findsOneWidget);
  });

  testWidgets('Signup button triggers signup process',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: AuthScreen(),
      ),
    );

    final emailField = find.byType(TextField).first;
    final passwordField = find.byType(TextField).last;
    final signupButton = find.byType(ElevatedButton);

    await tester.enterText(emailField, 'test@example.com');
    await tester.enterText(passwordField, 'password123');
    await tester.tap(signupButton);

    await tester.pump();

    final signupController = Get.find<SignupController>();
    expect(signupController.isLoading.value, true);

    await tester.pump(Duration(seconds: 2));
    expect(signupController.isLoading.value, false);
  });
}
