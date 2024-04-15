class Email {
  final String value;

  Email(this.value) {
    if (!_validateEmail(value)) {
      throw const FormatException('Invalid email');
    }
  }

  bool _validateEmail(String email) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Email &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}
