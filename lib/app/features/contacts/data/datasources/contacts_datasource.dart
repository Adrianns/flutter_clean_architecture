import 'package:clean_architecture_course/app/core/utils/either.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/entities/contact.dart';

abstract class ContactsDatasource {
  Future<Either<Exception, List<Contact>>> getAll();
  Future<Either<Exception, Contact>> create(Contact contact);
  Future<void> delete(Contact contact);
}
