import 'package:flutter_test/flutter_test.dart';
import 'package:clean_architecture_course/app/features/contacts/data/datasources/contacts_api_datasource.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/entities/contact.dart';
import 'package:clean_architecture_course/app/core/domain/value_objects/email.dart';
import 'package:clean_architecture_course/app/core/domain/value_objects/phone_number.dart';

void main() {
  group('ContactsAPIDatasource', () {
    late ContactsAPIDatasource datasource;
    final contact = Contact(
      id: '1',
      name: 'John Doe',
      email: Email('john.doe@example.com'),
      phone: PhoneNumber('+59892232265'),
    );

    setUpAll(() {
      datasource = ContactsAPIDatasource();
    });

    test('should create a contact', () async {
      final result = await datasource.create(contact);

      expect(result.fold((l) => null, (r) => r), isA<Contact>());
    });

    test('should get all contacts', () async {
      final result = await datasource.getAll();

      expect(result.fold((l) => null, (r) => r), isA<List<Contact>>());
    });
  });
}
