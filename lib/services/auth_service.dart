class AuthService {
  // Simulates a network request for signing up a user
  Future<void> signup(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));

    if (email == 'error@example.com') {
      throw 'This email is already in use.';
    }

    print('User signed up with email: $email');
  }

  // Simulates a network request for logging in a user
  Future<void> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));

    if (email == '') {
      throw 'Email is required.';
    }

    if (password == '') {
      throw 'Password is required.';
    }
  }

  // Simulates a network request for logging out a user
  Future<void> logout() async {
    await Future.delayed(Duration(seconds: 2));
    print('User logged out');
  }

  // Simulates a network request for resetting a user's password
  Future<void> resetPassword(String email) async {
    await Future.delayed(Duration(seconds: 2));

    if (email == '') {
      throw 'Email is required.';
    }

    print('Password reset email sent to: $email');
  }

  // Simulates a network request for verifying a user's email
  Future<void> verifyEmail(String email) async {
    await Future.delayed(Duration(seconds: 2));

    if (email == '') {
      throw 'Email is required.';
    }

    print('Verification email sent to: $email');
  }
}
