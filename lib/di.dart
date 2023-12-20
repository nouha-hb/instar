import 'package:get_it/get_it.dart';
import 'package:instar/data/data_Sources/remote_data_source/product_3d_remote_data_source.dart';
import 'package:instar/data/data_Sources/remote_data_source/product_remote_data_source.dart';
import 'package:instar/data/data_Sources/remote_data_source/rating_remote_data_source.dart';
import 'package:instar/data/data_Sources/remote_data_source/reclamations_remote_data_source.dart';
import 'package:instar/data/data_Sources/remote_data_source/review_remote_data_source.dart';
import 'package:instar/data/data_Sources/remote_data_source/sales_remote_data_source.dart';
import 'package:instar/data/data_Sources/remote_data_source/wishlist_remote_data_source.dart';
import 'package:instar/data/data_sources/remote_data_source/category_remote_data_source.dart';
import 'package:instar/data/data_sources/remote_data_source/fournisseur_remote_data_source.dart';
import 'package:instar/data/data_sources/remote_data_source/paiement_remote_data_source.dart';
import 'package:instar/data/repositories/authentication_repository_impl.dart';
import 'package:instar/data/repositories/paiement_repository.dart';
import 'package:instar/data/repositories/product_3d_repository_impl.dart';
import 'package:instar/data/repositories/product_repository_impl.dart';
import 'package:instar/data/repositories/rating_repository_impl.dart';
import 'package:instar/data/repositories/reclamations_repository_impl.dart';
import 'package:instar/data/repositories/review_repository_impl.dart';
import 'package:instar/data/repositories/sales_repository_impl.dart';
import 'package:instar/data/repositories/wishlist_repository_impl.dart';
import 'package:instar/domain/repositories/authentication_repository.dart';
import 'package:instar/domain/repositories/cart_repository.dart';
import 'package:instar/domain/repositories/paiement_repository.dart';
import 'package:instar/domain/repositories/product3d_repository.dart';
import 'package:instar/domain/repositories/product_repository.dart';
import 'package:instar/domain/repositories/rating_repository.dart';
import 'package:instar/domain/repositories/reclamation_repository.dart';
import 'package:instar/domain/repositories/review_repository.dart';
import 'package:instar/domain/repositories/wishlist_repository.dart';
import 'package:instar/domain/usecases/authentication_usecases/auto_login_usecase.dart';
import 'package:instar/domain/usecases/authentication_usecases/facebook_login_usecase.dart';
import 'package:instar/domain/usecases/authentication_usecases/get_user_usecase.dart';
import 'package:instar/domain/usecases/authentication_usecases/google_login_usecase.dart';
import 'package:instar/domain/usecases/authentication_usecases/logout_usecase.dart';
import 'package:instar/domain/usecases/authentication_usecases/update_profil_usecase.dart';
import 'package:instar/domain/usecases/fournisseur_usecases/get_fournisseur_by_id_usecase.dart';
import 'package:instar/domain/usecases/paiement_usecases/paiement_usecase.dart';
import 'package:instar/domain/usecases/product_3d/get_3d_product_by_id_usecase.dart';
import 'package:instar/domain/usecases/product_3d/get_all_3d_products_usecase.dart';
import 'package:instar/domain/usecases/product_usecases/get_all_products_usecase.dart';
import 'package:instar/domain/usecases/product_usecases/get_one_product_usecase.dart';
import 'package:instar/domain/usecases/product_usecases/get_products_by_category_usecase.dart';
import 'package:instar/domain/usecases/product_usecases/get_products_by_subcategory_usecase.dart';
import 'package:instar/domain/usecases/promotion_usecases/get_all_promotions_usecase.dart';
import 'package:instar/domain/usecases/rating_usecases/add_rating_usecase.dart';
import 'package:instar/domain/usecases/rating_usecases/delete_rating_usecase.dart';
import 'package:instar/domain/usecases/rating_usecases/get_rating_average_use_case.dart';
import 'package:instar/domain/usecases/rating_usecases/get_ratings_usecase.dart';
import 'package:instar/domain/usecases/rating_usecases/get_single_rating_usecase.dart';
import 'package:instar/domain/usecases/rating_usecases/update_rating_usecase.dart';
import 'package:instar/domain/usecases/reclamation_usecases/add_reclamation_usecase.dart';
import 'package:instar/domain/usecases/reclamation_usecases/get_all_reclamations_usecase.dart';
import 'package:instar/domain/usecases/reclamation_usecases/get_single_reclamation.dart';
import 'package:instar/domain/usecases/review_usecases/add_review_usecase.dart';
import 'package:instar/domain/usecases/review_usecases/get_all_reviews_usecase.dart';
import 'package:instar/domain/usecases/review_usecases/remove_review.dart';
import 'package:instar/domain/usecases/review_usecases/update_review_usecase.dart';
import 'package:instar/domain/usecases/sales_usecases/add_sale_usecase.dart';
import 'package:instar/domain/usecases/sales_usecases/delete_sale_usecase.dart';
import 'package:instar/domain/usecases/sales_usecases/get_all_sales_usecase.dart';
import 'package:instar/domain/usecases/sales_usecases/get_single_sale_usecase.dart';
import 'package:instar/domain/usecases/widhlist_usecases/create_wishlist_usecase.dart';
import 'package:instar/domain/usecases/widhlist_usecases/get_wishlist_usecase.dart';
import 'package:instar/domain/usecases/widhlist_usecases/update_wishlist_usecase.dart';
import 'data/data_Sources/local_data_source/authentication_local_data_source.dart';
import 'data/data_Sources/remote_data_source/cart_remote_data_source.dart';
import 'data/data_Sources/remote_data_source/promotion_remote_data_source.dart';
import 'data/data_sources/remote_data_source/authentication_remote_data_source.dart';
import 'data/data_sources/remote_data_source/subcategory_remote_data_source.dart';
import 'data/repositories/cart_repository_impl.dart';
import 'data/repositories/category_reopsitory.dart';
import 'data/repositories/fournisseur_repository_impl.dart';
import 'data/repositories/promotion_repository_impl.dart';
import 'domain/repositories/category_repository.dart';
import 'domain/repositories/fournisseur_repository.dart';
import 'domain/repositories/promotion_repository.dart';
import 'domain/repositories/sales_repository.dart';
import 'domain/usecases/authentication_usecases/create_account_usecase.dart';
import 'domain/usecases/authentication_usecases/login_usecase.dart';
import 'domain/usecases/cart_usecases/create_cart_usecase.dart';
import 'domain/usecases/cart_usecases/get_cart_usecase.dart';
import 'domain/usecases/cart_usecases/update_cart_usecase.dart';
import 'domain/usecases/category_usecases/get_categories_usecase.dart';
import 'domain/usecases/fournisseur_usecases/get_fournisseurs_usecase.dart';
import 'domain/usecases/subcategories_usecases/get_subcategory_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // repositories
  sl.registerLazySingleton<AuthenticationRepository>(() =>
      AuthenticationRepositoryImpl(
          authRemoteDataSource: sl(), authLocalDataSource: sl()));

  sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImp(sl()));
  sl.registerLazySingleton<PaiementRepository>(
      () => PaiementRepositoryImpl(sl(), paiementremoteDataSource: sl()));

  sl.registerLazySingleton<ReviewRepository>(() => ReviewRepositoryImpl(sl()));
  sl.registerLazySingleton<PromotionRepository>(
      () => PromotionRepositoryImpl(sl()));
  sl.registerLazySingleton<WishListRepository>(
      () => WishListRepositoryImpl(sl()));
  sl.registerLazySingleton<CartRepository>(() => CartRepositoryImpl(sl()));
  sl.registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImpl(sl()));
  sl.registerLazySingleton<FournisseurRepository>(
      () => FournisseurRepositoryImpl(sl()));
  sl.registerLazySingleton<SalesRepository>(
    () => SalesRepositoryImpl(sl()));
  sl.registerLazySingleton<ReclamationRepository>(
      () => ReclamationsRepositoryImpl(sl()));
  sl.registerLazySingleton<RatingRepository>(
    () => RatingRepositoryImpl(sl()));
  sl.registerLazySingleton<Product3DRepository>(
    () =>Product3DRepositoryImpl(sl()));

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
  sl.registerLazySingleton<SubCategoryRemoteDataSource>(
      () => SubCategoryRemoteDataSourceImpl());
  sl.registerLazySingleton<FournisseurRemoteDataSource>(
      () => FournisseurRemoteDataSourceImpl());
  sl.registerLazySingleton<RatingRemoteDataSource>(
      () => RatingRemoteDataSourceImpl());
  sl.registerLazySingleton<SalesRemoteDataSource>(
      () => SalesRemoteDataSourceImp());
  sl.registerLazySingleton<ReclamtionsRemoteDataSource>(
      () => ReclamationRemoteDataSourceImpl());
  sl.registerLazySingleton<PaiementRemoteDataSource>(
      () => PaiementRemoteDataSourceImpl());
  sl.registerLazySingleton<Product3DRemoteDataSource> (
      () => Product3DRemoteDataSourceImpl());   

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

  /*---3D product usecases---*/
  sl.registerLazySingleton(() => GetAll3DProductsUseCase(sl()));
  sl.registerLazySingleton(() => Get3DProductsByIdUseCase(sl()));

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

  /*---subcategory usecases---*/
  sl.registerLazySingleton(() => GetAllSubCategoriesUsecase(sl()));

  /*---fournisseur usecases---*/
  sl.registerLazySingleton(() => GetAllFournisseursUsecase(sl()));
  sl.registerLazySingleton(() => GetFournisseursByIdUsecase(sl()));

  /*---rating usecases---*/
  sl.registerLazySingleton(() => AddRatingUsecase(sl()));
  sl.registerLazySingleton(() => GetRatingsUsecase(sl()));
  sl.registerLazySingleton(() => GetSingleRatingUsecase(sl()));
  sl.registerLazySingleton(() => UpdateRatingUsecase(sl()));
  sl.registerLazySingleton(() => DeleteRatingUsecase(sl()));
  sl.registerLazySingleton(() => GetRatingAverageUsecase(sl()));

  /*---sales usecases---*/
  sl.registerLazySingleton(() => AddSaleUsecase(sl()));
  sl.registerLazySingleton(() => GetAllSalesUsecase(sl()));
  sl.registerLazySingleton(() => GetSingleSalesUsecase(sl()));
  sl.registerLazySingleton(() => DeleteSaleUsecase(sl()));

  /*---reclamations usecases---*/
  sl.registerLazySingleton(() => AddReclamationsUsecase(sl()));
  sl.registerLazySingleton(() => GetAllReclamationsUsecase(sl()));
  sl.registerLazySingleton(() => GetSingleReclamationUsecase(sl()));

  /*---paiement usecases---*/
  sl.registerLazySingleton(() => PaiementUsecase(sl()));
}
