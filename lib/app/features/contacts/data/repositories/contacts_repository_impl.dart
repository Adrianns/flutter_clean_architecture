import 'package:clean_architecture_course/app/core/utils/either.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/entities/contact.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/repositories/contacts_repository.dart';

class ContactsRepositoryImpl implements ContactsRepository {
  List<Contact> contacts = [];
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
