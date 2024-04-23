import 'package:bloc_test/bloc_test.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/entities/contact.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/value_objects/email.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/value_objects/phone_number.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clean_architecture_course/app/features/contacts/presentation/pages/contact_list_page.dart';
import 'package:clean_architecture_course/app/features/contacts/presentation/cubit/contacts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockito/mockito.dart';

class MockContactsCubit extends MockCubit<ContactsState>
    implements ContactsCubit {}

void main() {
  MockContactsCubit mockContactsCubit = MockContactsCubit();
  List<Contact> contacts = [];

  setUp(() {
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
      when(mockContactsCubit.state).thenReturn(ContactsLoading());

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: mockContactsCubit,
            child: const ContactListPage(),
          ),
        ),
      );
      await tester.pump(Duration.zero);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should display "No Contacts" when contacts list is empty',
        (WidgetTester tester) async {
      when(mockContactsCubit.state).thenReturn(ContactsLoaded(contacts));

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: mockContactsCubit,
            child: const ContactListPage(),
          ),
        ),
      );

      expect(find.text('No Contacts'), findsOneWidget);
    });

    testWidgets('should display contacts list when contacts are loaded',
        (WidgetTester tester) async {
      when(mockContactsCubit.state).thenReturn(ContactsLoaded(contacts));

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: mockContactsCubit,
            child: ContactListPage(),
          ),
        ),
      );

      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(contacts.length));
    });

    testWidgets('should display error message when contacts loading fails',
        (WidgetTester tester) async {
      final errorMessage = 'Failed to load contacts';
      when(mockContactsCubit.state).thenReturn(ContactsError(errorMessage));

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: mockContactsCubit,
            child: ContactListPage(),
          ),
        ),
      );

      expect(find.text('Error: $errorMessage'), findsOneWidget);
    });
  });
}
