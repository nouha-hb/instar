import 'package:get_it/get_it.dart';
import 'package:instar/data/repositories/authentication_repository_impl.dart';
import 'package:instar/domain/repositories/authentication_repository.dart';


import 'data/data_Sources/local_data_source/authentication_local_data_source.dart';
import 'data/data_Sources/remote_data_source/authentication_remote_data_source.dart';
import 'domain/usecases/authentication_usecases/create_account_usecase.dart';
import 'domain/usecases/authentication_usecases/login_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // repositories
  sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(authRemoteDataSource: sl(),authLocalDataSource: sl()));

  // data sources
  sl.registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSourceImpl());
  sl.registerLazySingleton<AuthenticationLocalDataSource>(
      () => AuthenticationLocalDataSourceImpl());

  // usecases
  sl.registerLazySingleton(() => CreateAccountUsecase(sl()));
  sl.registerLazySingleton(() => LoginUsecase(sl()));
}
