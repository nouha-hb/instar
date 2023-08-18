import 'package:get_it/get_it.dart';
import 'package:instar/data/data_Sources/remote_data_source/product_remote_data_source.dart';
import 'package:instar/data/data_Sources/remote_data_source/review_remote_data_source.dart';
import 'package:instar/data/repositories/authentication_repository_impl.dart';
import 'package:instar/data/repositories/product_repository_impl.dart';
import 'package:instar/data/repositories/review_repository_impl.dart';
import 'package:instar/domain/repositories/authentication_repository.dart';
import 'package:instar/domain/repositories/product_repository.dart';
import 'package:instar/domain/repositories/review_repository.dart';
import 'package:instar/domain/usecases/authentication_usecases/auto_login_usecase.dart';
import 'package:instar/domain/usecases/authentication_usecases/facebook_login_usecase.dart';
import 'package:instar/domain/usecases/authentication_usecases/get_user_usecase.dart';
import 'package:instar/domain/usecases/authentication_usecases/google_login_usecase.dart';
import 'package:instar/domain/usecases/authentication_usecases/logout_usecase.dart';
import 'package:instar/domain/usecases/authentication_usecases/update_profil_usecase.dart';
import 'package:instar/domain/usecases/product_usecases/get_all_products_usecase.dart';
import 'package:instar/domain/usecases/product_usecases/get_one_product_usecase.dart';
import 'package:instar/domain/usecases/product_usecases/get_products_by_category_usecase.dart';
import 'package:instar/domain/usecases/product_usecases/get_products_by_subcategory_usecase.dart';
import 'package:instar/domain/usecases/review_usecases/add_review_usecase.dart';
import 'package:instar/domain/usecases/review_usecases/get_all_reviews_usecase.dart';
import 'package:instar/domain/usecases/review_usecases/remove_review.dart';
import 'package:instar/domain/usecases/review_usecases/update_review_usecase.dart';

import 'data/data_Sources/local_data_source/authentication_local_data_source.dart';
import 'data/data_Sources/remote_data_source/authentication_remote_data_source.dart';
import 'domain/usecases/authentication_usecases/create_account_usecase.dart';
import 'domain/usecases/authentication_usecases/login_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // repositories
  sl.registerLazySingleton<AuthenticationRepository>(() =>
      AuthenticationRepositoryImpl(
          authRemoteDataSource: sl(), authLocalDataSource: sl()));
  sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImp(sl()));
  sl.registerLazySingleton<ReviewRepository>(() => ReviewRepositoryImpl(sl()));

  // data sources
  sl.registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSourceImpl());
  sl.registerLazySingleton<AuthenticationLocalDataSource>(
      () => AuthenticationLocalDataSourceImpl());
  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl());
  sl.registerLazySingleton<ReviewRemoteDataSource>(
      () => RevieReviewRemoteDataSourceImpl());

  // usecases
  /*---Auth usecases---*/
  sl.registerLazySingleton(() => CreateAccountUsecase(sl()));
  sl.registerLazySingleton(() => LoginUsecase(sl()));
  sl.registerLazySingleton(() => UpdateProfilUsecase(sl()));
  sl.registerLazySingleton(() => GetUserUsecase(sl()));
  sl.registerLazySingleton(() => LogoutUsecase(sl()));
  sl.registerLazySingleton(() => GoogleLoginUsecase(sl()));
  sl.registerLazySingleton(() => FacebookLoginUsecase(sl()));
  sl.registerLazySingleton(() => AutoLoginUsecase(sl()));

  /*---product usecases---*/
  sl.registerLazySingleton(() => GetAllProductsUsecase(sl()));
  sl.registerLazySingleton(() => GetOneProductsUsecase(sl()));
  sl.registerLazySingleton(() => GetProductsByCategoryUsecase(sl()));
  sl.registerLazySingleton(() => GetProductsBySubCategoryUsecase(sl()));

  /*---review usecases---*/
  sl.registerLazySingleton(() => AddReviewUsecase(sl()));
  sl.registerLazySingleton(() => GetAllReviewsUsecase(sl()));
  sl.registerLazySingleton(() => RemoveReviewUsecase(sl()));
  sl.registerLazySingleton(() => UpdateReviewUsecase(sl()));

}
