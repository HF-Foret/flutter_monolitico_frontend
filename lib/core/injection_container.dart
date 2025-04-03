import 'package:flutter_application_1/features/auth/domain/useCases/login_user.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_application_1/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_application_1/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_application_1/features/auth/domain/repositories/auth_repository.dart';

final sl = GetIt.instance; // sl = Service Locator

void init() {
  // **Data sources**
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl());

  // **Repositories**
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(sl<AuthRemoteDataSource>()));

  // **Use cases**
  sl.registerLazySingleton(() => LoginUser(sl<AuthRepository>()));
}
