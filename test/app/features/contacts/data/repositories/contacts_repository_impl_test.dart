import 'package:clean_architecture_course/app/core/utils/either.dart';
import 'package:clean_architecture_course/app/features/contacts/data/datasources/contacts_api_datasource.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/repositories/contacts_repository.dart';
import 'package:clean_architecture_course/app/core/domain/value_objects/email.dart';
import 'package:clean_architecture_course/app/core/domain/value_objects/phone_number.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clean_architecture_course/app/features/contacts/data/repositories/contacts_repository_impl.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/entities/contact.dart';
import 'package:mocktail/mocktail.dart';

class MockContactsAPIDatasource extends Mock implements ContactsAPIDatasource {}

void main() {
  late MockContactsAPIDatasource contactsAPIDatasource;
  late ContactsRepository userRepository;

  final contact = Contact(
    id: '1',
    name: 'John Doe',
    email: Email('john.doe@example.com'),
    phone: PhoneNumber('+59892232265'),
  );
  final contact2 = Contact(
    id: '2',
    name: 'Jane Smith',
    email: Email('jane.smith@example.com'),
    phone: PhoneNumber('+59892232266'),
  );
  setUp(() {
    contactsAPIDatasource = MockContactsAPIDatasource();
    userRepository = ContactsRepositoryImpl(contactsAPIDatasource);
  });

  group('UserRepository', () {
    test('should create a user and return a user', () async {
      when(() => contactsAPIDatasource.create(contact))
          .thenAnswer((_) => Future.value(Either.right(contact)));
      final result = await userRepository.createContact(contact);
      expect(result.fold((l) => null, (r) => r), isA<Contact>());
    });

    test('should return a list of users when there are users', () async {
      when(() => contactsAPIDatasource.getAll())
          .thenAnswer((_) => Future.value(Either.right([contact, contact2])));
      final result = await userRepository.getAllContacts();
      expect(result.fold((l) => null, (r) => r), isA<List>());
    });
  });
}
