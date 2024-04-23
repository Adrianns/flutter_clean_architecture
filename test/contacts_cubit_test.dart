import 'package:bloc_test/bloc_test.dart';
import 'package:clean_architecture_course/app/core/utils/either.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/entities/contact.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/usecases/create_contact_usecase.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/usecases/get_all_contact_usecase.dart';
import 'package:clean_architecture_course/app/features/contacts/presentation/cubit/contacts_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCreateContactUseCase extends Mock implements CreateContactUseCase {}

class MockGetAllContactsUseCase extends Mock implements GetAllContactsUseCase {}

void main() {
  group('ContactsCubit', () {
    late ContactsCubit contactsCubit;
    late MockCreateContactUseCase mockCreateContactUseCase;
    late MockGetAllContactsUseCase mockGetAllContactsUseCase;

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
        when(mockGetAllContactsUseCase.execute())
            .thenAnswer((_) async => Either.right(<Contact>[]));
        return contactsCubit;
      },
      act: (cubit) => cubit.getAllContacts(),
      expect: () => [
        ContactsLoading(),
        ContactsLoaded(<Contact>[]),
      ],
    );

    blocTest<ContactsCubit, ContactsState>(
      'getAllContacts should emit ContactsLoading and ContactsError',
      build: () {
        when(mockGetAllContactsUseCase.execute())
            .thenAnswer((_) async => Either.left(Exception()));
        return contactsCubit;
      },
      act: (cubit) => cubit.getAllContacts(),
      expect: () => [
        ContactsLoading(),
        ContactsError('Error'),
      ],
    );
  });
}
