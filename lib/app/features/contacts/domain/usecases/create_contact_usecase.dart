import 'package:clean_architecture_course/app/core/utils/either.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/repositories/contacts_repository.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/entities/contact.dart';

class CreateContactUseCase {
  final ContactsRepository userRepository;

  CreateContactUseCase(this.userRepository);

  Future<Either<Exception, Contact>> execute(Contact user) async {
    return await userRepository.createContact(user);
  }
}
