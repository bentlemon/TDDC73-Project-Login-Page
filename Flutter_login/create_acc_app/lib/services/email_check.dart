class EmailCheck {
  static bool validateEmail(String email) {
    // Check for the format "ab@c.d" + no spaces
    RegExp emailRegExp = RegExp(r'^[a-zA-Z]+@[a-zA-Z]+\.[a-zA-Z]+$');
    return email.isNotEmpty && email.length > 2 && emailRegExp.hasMatch(email);
  }
}