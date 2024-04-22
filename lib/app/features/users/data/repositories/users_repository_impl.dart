import 'package:clean_architecture_course/app/core/utils/either.dart';
import 'package:clean_architecture_course/app/features/users/domain/entities/user.dart';
import 'package:clean_architecture_course/app/features/users/domain/repositories/users_repository.dart';

class UsersRepositoryImpl implements UsersRepository {
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
