import 'package:bloc_test/bloc_test.dart';
import 'package:clean_architecture_course/app/core/domain/value_objects/email.dart';
import 'package:clean_architecture_course/app/core/domain/value_objects/phone_number.dart';
import 'package:clean_architecture_course/app/core/utils/either.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/entities/contact.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/usecases/create_contact_usecase.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/usecases/get_all_contact_usecase.dart';
import 'package:clean_architecture_course/app/features/contacts/presentation/cubit/contacts_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCreateContactUseCase extends Mock implements CreateContactUseCase {}

class MockGetAllContactsUseCase extends Mock implements GetAllContactsUseCase {}

void main() {
  group('ContactsCubit', () {
    late ContactsCubit contactsCubit;
    late MockCreateContactUseCase mockCreateContactUseCase;
    late MockGetAllContactsUseCase mockGetAllContactsUseCase;

    final contact = Contact(
      id: '1',
      name: 'John Doe',
      email: Email('john.doe@example.com'),
      phone: PhoneNumber('+59892232265'),
    );

    setUp(() {
      mockCreateContactUseCase = MockCreateContactUseCase();
      mockGetAllContactsUseCase = MockGetAllContactsUseCase();
      contactsCubit = ContactsCubit(
        createContactUseCase: mockCreateContactUseCase,
        getAllContactsUseCase: mockGetAllContactsUseCase,
      );
    });

    tearDown(() {
      contactsCubit.close();
    });

    test('initial state should be ContactsInitial', () {
      expect(contactsCubit.state, ContactsInitial());
    });

    blocTest<ContactsCubit, ContactsState>(
      'getAllContacts should emit ContactsLoading and ContactsLoaded',
      build: () {
        when(mockGetAllContactsUseCase.execute)
            .thenAnswer((_) async => Either.right(<Contact>[]));
        return contactsCubit;
      },
      act: (cubit) => cubit.getAllContacts(),
      expect: () => [
        ContactsLoading(),
        const ContactsLoaded(<Contact>[]),
      ],
    );

    blocTest<ContactsCubit, ContactsState>(
      'getAllContacts should emit ContactsLoading and ContactsError',
      build: () {
        when(mockGetAllContactsUseCase.execute)
            .thenAnswer((_) async => Either.left(Exception('oops!')));
        return contactsCubit;
      },
      act: (cubit) => cubit.getAllContacts(),
      expect: () => [
        ContactsLoading(),
        ContactsError(Exception('oops!').toString()),
      ],
    );

    blocTest<ContactsCubit, ContactsState>(
      'createContact should emit ContactsLoading and ContactsLoaded',
      build: () {
        when(() => mockCreateContactUseCase.execute(contact))
            .thenAnswer((_) async => Future.value(Either.right(contact)));
        return contactsCubit;
      },
      act: (cubit) => cubit.createContact(contact),
      expect: () => [
        ContactsLoading(),
        const ContactsLoaded(<Contact>[]),
      ],
    );
  });
}
