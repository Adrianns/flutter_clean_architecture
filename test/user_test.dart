import 'package:flutter_test/flutter_test.dart';
import 'package:clean_architecture_course/entities/user.dart';
import 'package:clean_architecture_course/value_objects/email.dart';
import 'package:clean_architecture_course/value_objects/password.dart';

void main() {
  group('User', () {
    test('should create a valid user', () {
      final user = User(
        id: '1',
        name: 'John Doe',
        email: Email('john.doe@example.com'),
        password: Password('Abc12345'),
      );

      expect(user.id, '1');
      expect(user.name, 'John Doe');
      expect(user.email.value, 'john.doe@example.com');
      expect(user.password.value, 'Abc12345');
    });

    test('when create a user with an incorrect password should throw an error',
        () {
      expect(
          () => User(
                id: '1',
                name: 'John Doe',
                email: Email('john.doe@example.com'),
                password: Password('a'),
              ),
          throwsA(isA<FormatException>()));
    });

    test('when create a user with an incorrect email should throw an error',
        () {
      expect(
          () => User(
                id: '1',
                name: 'John Doe',
                email: Email('john.doexample.com'),
                password: Password('a134253654'),
              ),
          throwsA(isA<FormatException>()));
    });

    test('should be equal to another User object with the same id', () {
      final user1 = User(
        id: '1',
        name: 'John Doe',
        email: Email('john.doe@example.com'),
        password: Password('Abc12345'),
      );

      final user2 = User(
        id: '1',
        name: 'Jane Smith',
        email: Email('jane.smith@example.com'),
        password: Password('Xyz98765'),
      );

      expect(user1, equals(user2));
    });
  });
}
