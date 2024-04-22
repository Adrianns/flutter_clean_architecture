import 'package:clean_architecture_course/app/features/users/domain/value_objects/email.dart';
import 'package:clean_architecture_course/app/features/users/domain/value_objects/password.dart';

class User {
  String id;
  String name;
  Email email;
  Password password;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
