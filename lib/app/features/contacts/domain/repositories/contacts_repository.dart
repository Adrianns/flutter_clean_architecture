import 'package:clean_architecture_course/app/core/utils/either.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/entities/contact.dart';

/// Abstract class representing a repository for managing contacts.
abstract class ContactsRepository {
  /// Creates a new contact.
  ///
  /// Returns an [Either] object containing either an [Exception] if an error occurred,
  /// or a [Contact] object representing the created contact.
  Future<Either<Exception, Contact>> createContact(Contact user);

  /// Retrieves all contacts.
  ///
  /// Returns an [Either] object containing either an [Exception] if an error occurred,
  /// or a list of [Contact] objects representing all the contacts.
  Future<Either<Exception, List<Contact>>> getAllContacts();
}
