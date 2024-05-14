import 'package:clean_architecture_course/app/core/utils/either.dart';
import 'package:clean_architecture_course/app/features/contacts/data/datasources/contacts_api_datasource.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/entities/contact.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/repositories/contacts_repository.dart';

class ContactsRepositoryImpl implements ContactsRepository {
  final ContactsAPIDatasource contactsAPIDatasource;

  ContactsRepositoryImpl(this.contactsAPIDatasource);

  @override
  Future<Either<Exception, Contact>> createContact(Contact contact) async {
    await contactsAPIDatasource.create(contact);
    return Either.right(contact);
  }

  @override
  Future<Either<Exception, List<Contact>>> getAllContacts() async {
    final contacts = await contactsAPIDatasource.getAll();
    return contacts;
  }
}
