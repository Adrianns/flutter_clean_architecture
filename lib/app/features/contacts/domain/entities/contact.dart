import 'package:clean_architecture_course/app/core/domain/value_objects/email.dart';
import 'package:clean_architecture_course/app/core/domain/value_objects/phone_number.dart';
import 'package:equatable/equatable.dart';

/// Represents a contact entity.
class Contact extends Equatable {
  final String id;
  final String name;
  final Email email;
  final PhoneNumber phone;

  /// Constructs a [Contact] instance.
  const Contact({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  List<Object?> get props => [id];
}
