import 'package:flutter_test/flutter_test.dart';
import 'package:clean_architecture_course/value_objects/email.dart';

void main() {
  group('Email', () {
    test('should create a valid email', () {
      final email = Email('test@example.com');
      expect(email.value, 'test@example.com');
    });

    test('should throw a FormatException for an invalid email', () {
      expect(() => Email('invalid_email'), throwsA(isA<FormatException>()));
    });

    test('should be equal to another Email object with the same value', () {
      final email1 = Email('test@example.com');
      final email2 = Email('test@example.com');
      expect(email1, equals(email2));
    });
  });
}
