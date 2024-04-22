import 'package:flutter_test/flutter_test.dart';
import 'package:clean_architecture_course/app/features/users/domain/value_objects/password.dart';

void main() {
  group('Password', () {
    test('should create a valid password', () {
      final password = Password('Abc12345');
      expect(password.value, 'Abc12345');
    });

    test('should throw a FormatException for an invalid password', () {
      expect(() => Password('invalid'), throwsA(isA<FormatException>()));
    });

    test('should be equal to another Password object with the same value', () {
      final password1 = Password('Abc12345');
      final password2 = Password('Abc12345');
      expect(password1, equals(password2));
    });
  });
}
