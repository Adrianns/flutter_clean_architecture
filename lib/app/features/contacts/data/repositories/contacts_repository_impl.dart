import 'package:clean_architecture_course/app/core/utils/either.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/entities/contact.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/repositories/contacts_repository.dart';
import 'package:clean_architecture_course/app/core/domain/value_objects/email.dart';
import 'package:clean_architecture_course/app/core/domain/value_objects/phone_number.dart';

class ContactsRepositoryImpl implements ContactsRepository {
  List<Contact> contacts = [];

  ContactsRepositoryImpl() {
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
  }
  @override
  Either<Exception, Contact> createContact(Contact contact) {
    contacts.add(contact);
    return Either.right(contact);
  }

  @override
  Either<Exception, List<Contact>> getAllContacts() {
    return contacts.isEmpty
        ? Either.left(Exception('No contacts found'))
        : Either.right(contacts);
  }
}
