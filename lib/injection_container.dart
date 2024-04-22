import 'package:clean_architecture_course/app/features/contacts/data/repositories/contacts_repository_impl.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/repositories/contacts_repository.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/usecases/create_contact_usecase.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/usecases/get_all_contact_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // REPOSITORIES
  sl.registerLazySingleton<ContactsRepository>(
    () => ContactsRepositoryImpl(),
  );
  // USECASES
  sl.registerLazySingleton(() => CreateContactUseCase(sl()));
  sl.registerLazySingleton(() => GetAllContactsUseCase(sl()));
  // BLOC, CUBITS, PROVIDERS, ETC
  // sl.registerFactory(() => GetCurrentUserCubit(getCurrentUser: sl()));
}
