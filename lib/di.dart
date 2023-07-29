import 'package:get_it/get_it.dart';
import 'package:instar/data/repositories/authentication_repository_impl.dart';
import 'package:instar/domain/repositories/authentication_repository.dart';
import 'package:instar/domain/usecases/create_account_usecase.dart';
import 'package:instar/domain/usecases/login_usecase.dart';

import 'data/data_Sources/remote_data_source/authentication_remote_data_source.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // repositories
  sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(authRemoteDataSource: sl()));

  // data sources
  sl.registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSourceImpl());

  // usecases
  sl.registerLazySingleton(() => CreateAccountUsecase(sl()));
  sl.registerLazySingleton(() => LoginUsecase(sl()));
}
