class Validators {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'email is required';
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'passoword is  required';
    } else if (password.length < 5) {
      return 'Password must be at least 5 characters';
    }
    return null;
  }

  static String? isRequiredField(String? value) {
    if (value == null || value.isEmpty) {
      return 'field is  required';
    }
    return null;
  }
}