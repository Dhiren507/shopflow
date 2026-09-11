class Validators {
  static String? validateEmail(String? email) {
    if(email == null || email.isEmpty) {
      return 'email field required';
    }
  }


  static String? validatePassword(String? password) {
    if(password == null || password.isEmpty) {
      return 'Username field required';
    } else if(password.length < 6) {
      return 'Password must be at least 6 characters';
    }
  }
}