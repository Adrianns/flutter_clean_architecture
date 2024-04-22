import 'package:clean_architecture_course/app/core/utils/either.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/entities/contact.dart';

abstract class ContactsRepository {
  Either<Exception, Contact> createContact(Contact user);
  Either<Exception, List<Contact>> getAllContacts();
}
