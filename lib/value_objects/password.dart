class Password {
  final String value;

  Password(this.value) {
    if (!_validatePassword(value)) {
      throw const FormatException('Invalid password');
    }
  }

  bool _validatePassword(String password) {
    String pattern = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(password);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Password &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}
