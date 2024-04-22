import 'package:clean_architecture_course/app/core/utils/either.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/repositories/contacts_repository.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/entities/contact.dart';

class CreateContactUseCase {
  final ContactsRepository userRepository;

  CreateContactUseCase(this.userRepository);

  Either<Exception, Contact> execute(Contact user) {
    return userRepository.createContact(user);
  }
}
