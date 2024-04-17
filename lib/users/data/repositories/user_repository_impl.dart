import 'package:clean_architecture_course/core/utils/either.dart';
import 'package:clean_architecture_course/users/domain/entities/user.dart';
import 'package:clean_architecture_course/users/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  List<User> users = [];
  @override
  Either<Exception, User> createUser(User user) {
    users.add(user);
    return Either.right(user);
  }

  @override
  Either<Exception, List<User>> getAllUsers() {
    return users.isEmpty
        ? Either.left(Exception('No users found'))
        : Either.right(users);
  }
}
