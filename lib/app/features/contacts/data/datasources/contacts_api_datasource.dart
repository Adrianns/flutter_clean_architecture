import 'package:clean_architecture_course/app/core/domain/value_objects/email.dart';
import 'package:clean_architecture_course/app/core/domain/value_objects/phone_number.dart';
import 'package:clean_architecture_course/app/core/utils/either.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/entities/contact.dart';

import 'contacts_datasource.dart';

class ContactsAPIDatasource extends ContactsDatasource {
  List<Contact> contacts = [];
  ContactsAPIDatasource() {
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
  Future<Either<Exception, Contact>> create(Contact contact) {
    contacts.add(contact);
    return Future.value(Either.right(contact));
  }

  @override
  Future<void> delete(Contact contact) {
    contacts.remove(contact);
    return Future.value();
  }

  @override
  Future<Either<Exception, List<Contact>>> getAll() {
    return Future.value(Either.right(contacts));
  }
}
