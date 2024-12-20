class PasswordCheck {
  static double calculatePasswordStrength(String password) {
    double strength = 0.0;

    if (password.isEmpty) {
      return 0.0;
    }

    if (password.length < 6) {
      return 0.25;
    }

    if (RegExp(r'[A-Z]').hasMatch(password)) strength += 0.25;
    if (RegExp(r'[a-z]').hasMatch(password)) strength += 0.25;
    if (RegExp(r'[0-9]').hasMatch(password)) strength += 0.25;
    if (RegExp(r'[!@#\$&*~]').hasMatch(password)) strength += 0.25;

    return strength;
  }

  static String getPasswordStrengthLabel(double strength) {
    if(strength == 0.0){
      return '';
    }
    else if (strength < 0.5) {
      return 'Weak';
    } else if (strength < 0.75) {
      return 'Medium';
    } else if (strength < 0.80) {
      return 'Strong';
    } else {
      return 'Super strong!';
    }
  }
}
