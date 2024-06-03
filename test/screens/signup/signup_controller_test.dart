// test/screens/signup/signup_controller_test.dart
import 'package:flutter_template/screens/auth_page/signup_controller.dart';
import 'package:flutter_template/services/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Mock class for AuthService
class MockAuthService extends Mock implements AuthService {}

void main() {
  group('SignupController Test', () {
    late SignupController signupController;
    late MockAuthService mockAuthService;

    setUp(() {
      mockAuthService = MockAuthService();
      signupController = SignupController(authService: mockAuthService);
    });

    test('initial values are correct', () {
      expect(signupController.emailController.text, '');
      expect(signupController.passwordController.text, '');
      expect(signupController.isLoading.value, false);
    });

    test('signup success', () async {
      // Arrange
      final email = 'test@example.com';
      final password = 'password123';
      signupController.emailController.text = email;
      signupController.passwordController.text = password;
      when(mockAuthService.signup(email, password)).thenAnswer((_) async {});

      // Act
      signupController.signup();

      // Assert
      verify(mockAuthService.signup(email, password)).called(1);
      expect(signupController.isLoading.value, false);
    });

    test('signup failure', () async {
      // Arrange
      final email = 'test@example.com';
      final password = 'password123';
      final errorMessage = 'This email is already in use.';
      signupController.emailController.text = email;
      signupController.passwordController.text = password;
      when(mockAuthService.signup(email, password)).thenThrow(errorMessage);

      // Act
      signupController.signup();

      // Assert

      verify(mockAuthService.signup(email, password)).called(1);
      expect(signupController.isLoading.value, false);
    });
  });
}
