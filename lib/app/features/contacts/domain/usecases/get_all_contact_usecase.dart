import 'package:clean_architecture_course/app/core/utils/either.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/entities/contact.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/repositories/contacts_repository.dart';

/// Use case for getting all contacts.
class GetAllContactsUseCase {
  final ContactsRepository userRepository;

  GetAllContactsUseCase(this.userRepository);

  /// Executes the use case and returns a [Future] with the result.
  ///
  /// Returns a [Either] object that contains either an [Exception] if an error occurred,
  /// or a [List] of [Contact] objects if the operation was successful.
  Future<Either<Exception, List<Contact>>> execute() async {
    final users = userRepository.getAllContacts();
    return users;
  }
}
