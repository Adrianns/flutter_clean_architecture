import 'package:clean_architecture_course/app/features/contacts/domain/value_objects/phone_number.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/entities/contact.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/value_objects/email.dart';

void main() {
  group('contact', () {
    test('should create a valid contact', () {
      final contact = Contact(
        id: '1',
        name: 'John Doe',
        email: Email('john.doe@example.com'),
        phone: PhoneNumber('+598922322655'),
      );

      expect(contact.id, '1');
      expect(contact.name, 'John Doe');
      expect(contact.email.value, 'john.doe@example.com');
      expect(contact.phone.value, '+598922322655');
    });

    test('when create a contact with an incorrect email should throw an error',
        () {
      expect(
          () => Contact(
                id: '1',
                name: 'John Doe',
                email: Email('john.doexample.com'),
                phone: PhoneNumber('+598922322655'),
              ),
          throwsA(isA<FormatException>()));
    });

    test('should be equal to another Contact object with the same id', () {
      final contact1 = Contact(
        id: '1',
        name: 'John Doe',
        email: Email('john.doe@example.com'),
        phone: PhoneNumber('+598922322655'),
      );

      final contact2 = Contact(
        id: '1',
        name: 'Jane Smith',
        email: Email('jane.smith@example.com'),
        phone: PhoneNumber('+598922322655'),
      );
      expect(contact1, equals(contact2));
    });
  });
}
