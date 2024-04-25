class PhoneNumber {
  final String value;

  PhoneNumber(this.value) {
    if (!_validatePhoneNumber(value)) {
      throw const FormatException('Invalid phone number');
    }
  }

  bool _validatePhoneNumber(String phoneNumber) {
    String pattern = r'^\+\d{11}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(phoneNumber);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhoneNumber &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}
