import 'package:clean_architecture_course/app/core/domain/value_objects/email.dart';
import 'package:clean_architecture_course/app/core/domain/value_objects/phone_number.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/usecases/create_contact_usecase.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/repositories/contacts_repository.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/entities/contact.dart';
import 'package:clean_architecture_course/app/core/utils/either.dart';
import 'package:mocktail/mocktail.dart';

class MockContactsRepository extends Mock implements ContactsRepository {}

void main() {
  late ContactsRepository repository;
  late CreateContactUseCase useCase;
  final contact = Contact(
    id: '1',
    name: 'John Doe',
    email: Email('john.doe@example.com'),
    phone: PhoneNumber('+59892232265'),
  );

  setUp(() {
    repository = MockContactsRepository();
    useCase = CreateContactUseCase(repository);
  });
  group('CreateContactUseCase', () {
    test('should create a contact successfully', () {
      when(() => repository.createContact(contact))
          .thenReturn(Either.right(contact));

      final result = useCase.execute(contact);

      expect(result.fold((left) => left, (right) => right), isA<Contact>());
    });

    test('should return an exception when creating a contact fails', () {
      when(() => repository.createContact(contact))
          .thenReturn(Either.left(Exception('Oops!')));

      final result = useCase.execute(contact);

      expect(result.fold((left) => left, (right) => right), isA<Exception>());
    });
  });
}
