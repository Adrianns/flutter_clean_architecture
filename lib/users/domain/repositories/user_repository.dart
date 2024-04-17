import 'package:clean_architecture_course/core/utils/either.dart';
import 'package:clean_architecture_course/users/domain/entities/user.dart';

abstract class UserRepository {
  Either<Exception, User> createUser(User user);
  Either<Exception, List<User>> getAllUsers();
}
