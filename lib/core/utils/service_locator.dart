import 'package:chairy_app/core/services/api_auth_services.dart';
import 'package:chairy_app/core/services/api_db-services.dart';
import 'package:chairy_app/core/services/api_services.dart';
import 'package:chairy_app/core/shared/usecases/decrease_item.dart';
import 'package:chairy_app/core/shared/usecases/increase_item.dart';
import 'package:chairy_app/core/shared/usecases/is_item_exist.dart';
import 'package:chairy_app/core/utils/hive_service.dart';
import 'package:chairy_app/core/utils/internet_connectivity.dart';
import 'package:chairy_app/core/utils/local_notification_service.dart';
import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:chairy_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:chairy_app/features/auth/domain/usecases/create_order.dart';
import 'package:chairy_app/features/auth/domain/usecases/login.dart';
import 'package:chairy_app/features/auth/domain/usecases/register.dart';
import 'package:chairy_app/features/auth/domain/usecases/sync_cart_with_server.dart';
import 'package:chairy_app/features/cart/data/data_sources/cart_local_data_source.dart';
import 'package:chairy_app/features/cart/data/data_sources/cart_remote_data_source.dart';
import 'package:chairy_app/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:chairy_app/features/cart/domain/usecases/get_cashed_item_from_cart.dart';
import 'package:chairy_app/features/cart/domain/usecases/remove_item_from_cart.dart';
import 'package:chairy_app/features/categories/data/data_sources/category_local_data_source.dart';
import 'package:chairy_app/features/categories/data/data_sources/category_remote_data_source.dart';
import 'package:chairy_app/features/categories/data/data_sources/product_details_local_data_source.dart';
import 'package:chairy_app/features/categories/data/data_sources/products_category_local_data_source.dart';
import 'package:chairy_app/features/categories/data/data_sources/products_category_remote_data_source.dart';
import 'package:chairy_app/features/categories/data/data_sources/products_details_remote_data_source.dart';
import 'package:chairy_app/features/categories/data/repositories/category_repository_impl.dart';
import 'package:chairy_app/features/categories/data/repositories/product_details_repository_impl.dart';
import 'package:chairy_app/features/categories/data/repositories/products_category_repository_impl.dart';
import 'package:chairy_app/features/categories/domain/usecases/add_item_to_cart.dart';
import 'package:chairy_app/features/categories/domain/usecases/get_categories.dart';
import 'package:chairy_app/features/categories/domain/usecases/get_products_by_category_id.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<LocalNotificationService>(
    () => LocalNotificationService(),
  );

  getIt.registerSingleton<InternetConnectivity>(InternetConnectivity());

  getIt.registerSingleton<MySharedPreferences>(MySharedPreferences());

  getIt.registerSingleton<HiveService>(HiveService());

  getIt.registerSingleton<ApiService>(ApiService());

  getIt.registerSingleton<ApiDBServices>(
    ApiDBServices(getIt.get<ApiService>()),
  );

  getIt.registerSingleton<CategoryRemoteDataSourceImpl>(
    CategoryRemoteDataSourceImpl(getIt.get<ApiDBServices>()),
  );

  getIt.registerSingleton<CategoryLocalDataSourceImpl>(
    CategoryLocalDataSourceImpl(getIt.get<HiveService>()),
  );

  getIt.registerSingleton<CategoryRepositoryImpl>(
    CategoryRepositoryImpl(
      getIt.get<CategoryRemoteDataSourceImpl>(),
      getIt.get<CategoryLocalDataSourceImpl>(),
      getIt.get<InternetConnectivity>(),
    ),
  );

  getIt.registerSingleton<GetCategories>(
    GetCategories(getIt.get<CategoryRepositoryImpl>()),
  );

  getIt.registerSingleton<ProductDetailsLocalDataSourceImpl>(
    ProductDetailsLocalDataSourceImpl(getIt.get<HiveService>()),
  );

  getIt.registerSingleton<ProductsDetailsRemoteDataSourceImpl>(
    ProductsDetailsRemoteDataSourceImpl(getIt.get<ApiDBServices>()),
  );

  getIt.registerSingleton<ProductDetailsRepositoryImpl>(
    ProductDetailsRepositoryImpl(
      getIt.get<ProductDetailsLocalDataSourceImpl>(),
      getIt.get<ProductsDetailsRemoteDataSourceImpl>(),
      getIt.get<InternetConnectivity>(),
      getIt.get<MySharedPreferences>(),
    ),
  );

  getIt.registerSingleton<AddItemToCart>(
    AddItemToCart(getIt.get<ProductDetailsRepositoryImpl>()),
  );

  getIt.registerSingleton<CartLocalDataSourceImpl>(
    CartLocalDataSourceImpl(getIt.get<HiveService>()),
  );

  getIt.registerSingleton<CartRemoteDataSourceImpl>(
    CartRemoteDataSourceImpl(getIt.get<ApiDBServices>()),
  );

  getIt.registerSingleton<CartRepositoryImpl>(
    CartRepositoryImpl(
      getIt.get<CartLocalDataSourceImpl>(),
      getIt.get<CartRemoteDataSourceImpl>(),
      getIt.get<InternetConnectivity>(),
      getIt.get<MySharedPreferences>(),
    ),
  );

  getIt.registerSingleton<GetCashedItemFromCart>(
    GetCashedItemFromCart(getIt.get<CartRepositoryImpl>()),
  );

  getIt.registerSingleton<RemoveItemFromCart>(
    RemoveItemFromCart(getIt.get<CartRepositoryImpl>()),
  );

  getIt.registerSingleton<ProductsCategoryRemoteDataSourceImpl>(
    ProductsCategoryRemoteDataSourceImpl(getIt.get<ApiDBServices>()),
  );

  getIt.registerSingleton<ProductsCategoryLocalDataSourceImpl>(
    ProductsCategoryLocalDataSourceImpl(getIt.get<HiveService>()),
  );

  getIt.registerSingleton<ProductsCategoryRepositoryImpl>(
    ProductsCategoryRepositoryImpl(
      getIt.get<ProductsCategoryRemoteDataSourceImpl>(),
      getIt.get<ProductsCategoryLocalDataSourceImpl>(),
      getIt.get<InternetConnectivity>(),
    ),
  );

  getIt.registerSingleton<GetProductsByCategoryId>(
    GetProductsByCategoryId(getIt.get<ProductsCategoryRepositoryImpl>()),
  );

  getIt.registerSingleton<ApiAuthServices>(
    ApiAuthServices(getIt.get<ApiService>()),
  );

  getIt.registerSingleton<AuthRemoteDataSourceImpl>(AuthRemoteDataSourceImpl(
    getIt.get<ApiAuthServices>(),
    getIt.get<ApiDBServices>(),
  ));

  getIt.registerSingleton<AuthRepositoryImpl>(
    AuthRepositoryImpl(getIt.get<AuthRemoteDataSourceImpl>()),
  );

  getIt.registerSingleton<Register>(
    Register(getIt.get<AuthRepositoryImpl>()),
  );

  getIt.registerSingleton<Login>(
    Login(getIt.get<AuthRepositoryImpl>()),
  );

  getIt.registerSingleton<SyncCartWithServer>(
    SyncCartWithServer(getIt.get<AuthRepositoryImpl>()),
  );

  getIt.registerSingleton<CreateOrder>(
    CreateOrder(getIt.get<AuthRepositoryImpl>()),
  );

  getIt.registerSingleton<IncreaseItem>(
    IncreaseItem(getIt.get<ProductDetailsRepositoryImpl>()),
  );

  getIt.registerSingleton<DecreaseItem>(
    DecreaseItem(getIt.get<ProductDetailsRepositoryImpl>()),
  );

  getIt.registerSingleton<IsItemExist>(
    IsItemExist(getIt.get<ProductDetailsRepositoryImpl>()),
  );
}
