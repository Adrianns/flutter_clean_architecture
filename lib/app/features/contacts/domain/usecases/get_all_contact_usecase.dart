import 'package:clean_architecture_course/app/core/utils/either.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/entities/contact.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/repositories/contacts_repository.dart';

class GetAllContactsUseCase {
  final ContactsRepository userRepository;

  GetAllContactsUseCase(this.userRepository);

  Future<Either<Exception, List<Contact>>> execute() async {
    final users = userRepository.getAllContacts();
    return users;
  }
}
