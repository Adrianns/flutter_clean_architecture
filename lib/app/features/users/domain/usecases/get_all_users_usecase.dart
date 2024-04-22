import 'package:clean_architecture_course/app/core/utils/either.dart';
import 'package:clean_architecture_course/app/features/users/domain/entities/user.dart';
import 'package:clean_architecture_course/app/features/users/domain/repositories/users_repository.dart';

class GetAllUsersUseCase {
  final UsersRepository userRepository;

  GetAllUsersUseCase(this.userRepository);

  Either<Exception, List<User>> execute() {
    final users = userRepository.getAllUsers();
    return users;
  }
}
