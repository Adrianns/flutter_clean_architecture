import 'package:clean_architecture_course/users/domain/repositories/user_repository.dart';
import 'package:clean_architecture_course/users/domain/value_objects/email.dart';
import 'package:clean_architecture_course/users/domain/value_objects/password.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clean_architecture_course/users/data/repositories/user_repository_impl.dart';
import 'package:clean_architecture_course/users/domain/entities/user.dart';

void main() {
  group('UserRepository', () {
    late UserRepository userRepository;
    final user = User(
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
    setUp(() {
      userRepository = UserRepositoryImpl();
    });

    test('should create a user and return a user', () {
      final result = userRepository.createUser(user);
      expect(result.isRight, true);
    });

    test('should return a list of users when there are users', () {
      userRepository.createUser(user);
      userRepository.createUser(user2);
      final result = userRepository.getAllUsers();
      expect(result.fold((l) => null, (r) => r), isA<List>());
    });

    test('should return Exception when there are no users', () {
      final result = userRepository.getAllUsers();
      expect(result.isLeft, true);
      expect(result.fold((l) => l, (r) => null), isA<Exception>());
    });
  });
}
