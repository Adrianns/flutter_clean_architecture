import 'package:clean_architecture_course/app/core/utils/either.dart';
import 'package:clean_architecture_course/app/features/users/domain/repositories/users_repository.dart';
import 'package:clean_architecture_course/app/features/users/domain/entities/user.dart';

class CreateUserUseCase {
  final UsersRepository userRepository;

  CreateUserUseCase(this.userRepository);

  Either<Exception, User> execute(User user) {
    return userRepository.createUser(user);
  }
}
