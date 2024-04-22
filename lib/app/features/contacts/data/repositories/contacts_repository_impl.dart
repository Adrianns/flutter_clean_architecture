import 'package:clean_architecture_course/app/core/utils/either.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/entities/contact.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/repositories/contacts_repository.dart';

class ContactsRepositoryImpl implements ContactsRepository {
  List<Contact> users = [];
  @override
  Either<Exception, Contact> createContact(Contact user) {
    users.add(user);
    return Either.right(user);
  }

  @override
  Either<Exception, List<Contact>> getAllContacts() {
    return users.isEmpty
        ? Either.left(Exception('No users found'))
        : Either.right(users);
  }
}
