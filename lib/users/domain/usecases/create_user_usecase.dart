import 'package:clean_architecture_course/core/utils/either.dart';
import 'package:clean_architecture_course/users/domain/repositories/user_repository.dart';
import 'package:clean_architecture_course/users/domain/entities/user.dart';

class CreateUserUseCase {
  final UserRepository userRepository;

  CreateUserUseCase(this.userRepository);

  Either<Exception, User> execute(User user) {
    return userRepository.createUser(user);
  }
}
