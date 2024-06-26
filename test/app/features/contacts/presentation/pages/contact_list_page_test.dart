import 'package:bloc_test/bloc_test.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/entities/contact.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/usecases/create_contact_usecase.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/usecases/get_all_contact_usecase.dart';
import 'package:clean_architecture_course/app/core/domain/value_objects/email.dart';
import 'package:clean_architecture_course/app/core/domain/value_objects/phone_number.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clean_architecture_course/app/features/contacts/presentation/pages/contact_list_page.dart';
import 'package:clean_architecture_course/app/features/contacts/presentation/cubit/contacts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockContactsCubit extends MockCubit<ContactsState>
    implements ContactsCubit {}

class MockCreateContactUseCase extends Mock implements CreateContactUseCase {}

class MockGetAllContactsUseCase extends Mock implements GetAllContactsUseCase {}

void main() {
  late MockContactsCubit mockContactsCubit;
  List<Contact> contacts = [];

  setUp(() {
    mockContactsCubit = MockContactsCubit();
    for (int i = 0; i <= 18; i++) {
      contacts.add(
        Contact(
          id: '$i',
          name: 'Contact $i',
          email: Email('contact$i@example.com'),
          phone: PhoneNumber('+59898123254'),
        ),
      );
    }
  });
  group('ContactListPage', () {
    testWidgets('should display loading indicator when contacts are loading',
        (WidgetTester tester) async {
      when(() => mockContactsCubit.state).thenReturn(ContactsLoading());

      await tester.pumpWidget(
        MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider<ContactsCubit>(
                  create: (context) => mockContactsCubit..getAllContacts()),
            ],
            child: const ContactListPage(),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should display "No Contacts" when contacts list is empty',
        (WidgetTester tester) async {
      when(() => mockContactsCubit.state).thenReturn(const ContactsLoaded([]));

      await tester.pumpWidget(
        MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider<ContactsCubit>(
                  create: (context) => mockContactsCubit..getAllContacts()),
            ],
            child: const ContactListPage(),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('No Contacts'), findsOneWidget);
    });

    testWidgets('should display contacts list when contacts are loaded',
        (WidgetTester tester) async {
      when(() => mockContactsCubit.state).thenReturn(ContactsLoaded(contacts));

      await tester.pumpWidget(
        MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider<ContactsCubit>(
                  create: (context) => mockContactsCubit..getAllContacts()),
            ],
            child: const ContactListPage(),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('should display error message when contacts loading fails',
        (WidgetTester tester) async {
      const errorMessage = 'Failed to load contacts';
      when(() => mockContactsCubit.state)
          .thenReturn(const ContactsError(errorMessage));

      await tester.pumpWidget(
        MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider<ContactsCubit>(
                  create: (context) => mockContactsCubit..getAllContacts()),
            ],
            child: const ContactListPage(),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Error: $errorMessage'), findsOneWidget);
    });
  });
}
