import 'package:clean_architecture_course/core/utils/either.dart';
import 'package:clean_architecture_course/users/domain/entities/user.dart';
import 'package:clean_architecture_course/users/domain/repositories/user_repository.dart';

class GetAllUsersUseCase {
  final UserRepository userRepository;

  GetAllUsersUseCase(this.userRepository);

  Either<Exception, List<User>> execute() {
    final users = userRepository.getAllUsers();
    return users;
  }
}
