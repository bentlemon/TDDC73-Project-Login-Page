class NameCheck {
  static bool validateName(String name) {
    RegExp regExp = RegExp(r'^[a-zA-Z]+$');
    return name.isNotEmpty && name.length >= 2 && regExp.hasMatch(name);
  }
}