import 'package:clean_architecture_course/app/core/utils/either.dart';
import 'package:clean_architecture_course/app/features/users/domain/entities/user.dart';

abstract class UsersRepository {
  Either<Exception, User> createUser(User user);
  Either<Exception, List<User>> getAllUsers();
}
