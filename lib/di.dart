import 'package:get_it/get_it.dart';
import 'package:instar/data/data_Sources/remote_data_source/product_remote_data_source.dart';
import 'package:instar/data/data_Sources/remote_data_source/rating_remote_data_source.dart';
import 'package:instar/data/data_Sources/remote_data_source/review_remote_data_source.dart';
import 'package:instar/data/data_Sources/remote_data_source/wishlist_remote_data_source.dart';
import 'package:instar/data/data_sources/remote_data_source/category_remote_data_source.dart';
import 'package:instar/data/data_sources/remote_data_source/fournisseur_remote_data_source.dart';
import 'package:instar/data/repositories/authentication_repository_impl.dart';
import 'package:instar/data/repositories/product_repository_impl.dart';
import 'package:instar/data/repositories/rating_repository_impl.dart';
import 'package:instar/data/repositories/review_repository_impl.dart';
import 'package:instar/data/repositories/wishlist_repository_impl.dart';
import 'package:instar/domain/repositories/authentication_repository.dart';
import 'package:instar/domain/repositories/cart_repository.dart';
import 'package:instar/domain/repositories/product_repository.dart';
import 'package:instar/domain/repositories/rating_repository.dart';
import 'package:instar/domain/repositories/review_repository.dart';
import 'package:instar/domain/repositories/wishlist_repository.dart';
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
import 'package:instar/domain/usecases/promotion_usecases/get_all_promotions_usecase.dart';
import 'package:instar/domain/usecases/rating_usecases/add_rating_usecase.dart';
import 'package:instar/domain/usecases/rating_usecases/delete_rating_usecase.dart';
import 'package:instar/domain/usecases/rating_usecases/get_ratings_usecase.dart';
import 'package:instar/domain/usecases/rating_usecases/get_single_rating_usecase.dart';
import 'package:instar/domain/usecases/rating_usecases/update_rating_usecase.dart';
import 'package:instar/domain/usecases/review_usecases/add_review_usecase.dart';
import 'package:instar/domain/usecases/review_usecases/get_all_reviews_usecase.dart';
import 'package:instar/domain/usecases/review_usecases/remove_review.dart';
import 'package:instar/domain/usecases/review_usecases/update_review_usecase.dart';
import 'package:instar/domain/usecases/widhlist_usecases/create_wishlist_usecase.dart';
import 'package:instar/domain/usecases/widhlist_usecases/get_wishlist_usecase.dart';
import 'package:instar/domain/usecases/widhlist_usecases/update_wishlist_usecase.dart';
import 'data/data_Sources/local_data_source/authentication_local_data_source.dart';
import 'data/data_Sources/remote_data_source/authentication_remote_data_source.dart';
import 'data/data_Sources/remote_data_source/cart_remote_data_source.dart';
import 'data/data_Sources/remote_data_source/promotion_remote_data_source.dart';
import 'data/repositories/cart_repository_impl.dart';
import 'data/repositories/category_reopsitory.dart';
import 'data/repositories/fournisseur_repository.dart';
import 'data/repositories/promotion_repository_impl.dart';
import 'domain/repositories/category_repository.dart';
import 'domain/repositories/fournisseur_repository.dart';
import 'domain/repositories/promotion_repository.dart';
import 'domain/usecases/authentication_usecases/create_account_usecase.dart';
import 'domain/usecases/authentication_usecases/login_usecase.dart';
import 'domain/usecases/cart_usecases/create_cart_usecase.dart';
import 'domain/usecases/cart_usecases/get_cart_usecase.dart';
import 'domain/usecases/cart_usecases/update_cart_usecase.dart';
import 'domain/usecases/category_usecases/get_categories_usecase.dart';
import 'domain/usecases/fournisseur_usecases/get_fournisseurs_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // repositories
  sl.registerLazySingleton<AuthenticationRepository>(() =>
      AuthenticationRepositoryImpl(
          authRemoteDataSource: sl(), authLocalDataSource: sl()));
  sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImp(sl()));
  sl.registerLazySingleton<ReviewRepository>(() => ReviewRepositoryImpl(sl()));
  sl.registerLazySingleton<PromotionRepository>(() => PromotionRepositoryImpl(sl()));
  sl.registerLazySingleton<WishListRepository>(() => WishListRepositoryImpl(sl()));
  sl.registerLazySingleton<CartRepository>(() =>CartRepositoryImpl(sl()));
  sl.registerLazySingleton<CategoryRepository>(() =>CategoryRepositoryImpl(sl()));
  sl.registerLazySingleton<FournisseurRepository>(() =>FournisseurRepositoryImpl(sl()));


  sl.registerLazySingleton<RatingRepository>(() =>RatingRepositoryImpl(sl()));


  // data sources
  sl.registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSourceImpl());
  sl.registerLazySingleton<AuthenticationLocalDataSource>(
      () => AuthenticationLocalDataSourceImpl());
  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl());
  sl.registerLazySingleton<ReviewRemoteDataSource>(
      () => ReviewRemoteDataSourceImpl());
  sl.registerLazySingleton<PromotionRemoteDataSource>(
      () => PromotionRemoteDataSourceImpl());
  sl.registerLazySingleton<WishlistRemoteDataSource>(
      () => WishlistRemoteDataSourceImpl());
  sl.registerLazySingleton<CartRemoteDataSource>(
      () => CartRemoteDataSourceImpl());
  sl.registerLazySingleton<CategoryRemoteDataSource>(
      () => CategoryRemoteDataSourceImpl());
  sl.registerLazySingleton<FournisseurRemoteDataSource>(
      () => FournisseurRemoteDataSourceImpl());
  sl.registerLazySingleton<RatingRemoteDataSource>(
      () => RatingRemoteDataSourceImpl());    

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

  /*---promotion usecases---*/
  sl.registerLazySingleton(() => GetAllPromotionsUsecase(sl()));

  /*---wishlist usecases---*/
  sl.registerLazySingleton(() => CreateWishListUsecase(sl()));
  sl.registerLazySingleton(() => GetWishListUsecase(sl()));
  sl.registerLazySingleton(() => UpdateWishListUsecase(sl()));

  /*---cart usecases---*/
  sl.registerLazySingleton(() => CreateCartUsecase(sl()));
  sl.registerLazySingleton(() => GetCartUsecase(sl()));
  sl.registerLazySingleton(() => UpdateCartUsecase(sl()));

    /*---category usecases---*/
  sl.registerLazySingleton(() => GetAllCategoriesUsecase(sl()));

   /*---fournisseur usecases---*/
  sl.registerLazySingleton(() => GetAllFournisseursUsecase(sl()));
  /*---rating usecases---*/
  sl.registerLazySingleton(() => AddRatingUsecase(sl()));
  sl.registerLazySingleton(() => GetRatingsUsecase(sl()));
  sl.registerLazySingleton(() => GetSingleRatingUsecase(sl()));
  sl.registerLazySingleton(() => UpdateRatingUsecase(sl()));
  sl.registerLazySingleton(() => DeleteRatingUsecase(sl()));


}



