import 'package:clean_architecture_course/app/features/contacts/domain/repositories/contacts_repository.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/value_objects/email.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/value_objects/phone_number.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clean_architecture_course/app/features/contacts/data/repositories/contacts_repository_impl.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/entities/contact.dart';

void main() {
  late ContactsRepository userRepository;

  final user = Contact(
    id: '1',
    name: 'John Doe',
    email: Email('john.doe@example.com'),
    phone: PhoneNumber('+59892232265'),
  );
  final user2 = Contact(
    id: '1',
    name: 'Jane Smith',
    email: Email('jane.smith@example.com'),
    phone: PhoneNumber('+59892232266'),
  );
  setUp(() {
    userRepository = ContactsRepositoryImpl();
  });

  group('UserRepository', () {
    test('should create a user and return a user', () {
      final result = userRepository.createContact(user);
      expect(result.isRight, true);
    });

    test('should return a list of users when there are users', () {
      userRepository.createContact(user);
      userRepository.createContact(user2);
      final result = userRepository.getAllContacts();
      expect(result.fold((l) => null, (r) => r), isA<List>());
    });

    /* test('should return Exception when there are no users', () {
      final result = userRepository.getAllContacts();
      expect(result.isLeft, true);
      expect(result.fold((l) => l, (r) => null), isA<Exception>());
    }); */
  });
}
