import 'package:clean_architecture_course/app/features/users/data/repositories/users_repository_impl.dart';
import 'package:clean_architecture_course/app/features/users/domain/repositories/users_repository.dart';
import 'package:clean_architecture_course/app/features/users/domain/usecases/create_user_usecase.dart';
import 'package:clean_architecture_course/app/features/users/domain/usecases/get_all_users_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // REPOSITORIES
  sl.registerLazySingleton<UsersRepository>(
    () => UsersRepositoryImpl(),
  );
  // USECASES
  sl.registerLazySingleton(() => CreateUserUseCase(sl()));
  sl.registerLazySingleton(() => GetAllUsersUseCase(sl()));
  // BLOC, CUBITS, PROVIDERS, ETC
  // sl.registerFactory(() => GetCurrentUserCubit(getCurrentUser: sl()));
}
