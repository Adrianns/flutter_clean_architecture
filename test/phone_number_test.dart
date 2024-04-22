import 'package:flutter_test/flutter_test.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/value_objects/phone_number.dart';

void main() {
  group('PhoneNumber', () {
    test('should create a valid phone number', () {
      final phoneNumber = PhoneNumber('+12345678901');
      expect(phoneNumber.value, '+12345678901');
    });

    test('should throw a FormatException for an invalid phone number', () {
      expect(() => PhoneNumber('12345678901'), throwsA(isA<FormatException>()));
    });

    test('should be equal to another PhoneNumber object with the same value',
        () {
      final phoneNumber1 = PhoneNumber('+12345678901');
      final phoneNumber2 = PhoneNumber('+12345678901');
      expect(phoneNumber1, equals(phoneNumber2));
    });
  });
}
