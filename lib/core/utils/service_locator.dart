import 'package:chairy_app/core/services/api_auth_services.dart';
import 'package:chairy_app/core/services/api_db-services.dart';
import 'package:chairy_app/core/services/api_services.dart';
import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:chairy_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:chairy_app/features/auth/domain/usecases/login.dart';
import 'package:chairy_app/features/auth/domain/usecases/register.dart';
import 'package:chairy_app/features/categories/data/data_sources/category_local_data_source.dart';
import 'package:chairy_app/features/categories/data/data_sources/category_remote_data_source.dart';
import 'package:chairy_app/features/categories/data/data_sources/product_local_data_source.dart';
import 'package:chairy_app/features/categories/data/data_sources/product_remote_data_source.dart';
import 'package:chairy_app/features/categories/data/repositories/category_repository_impl.dart';
import 'package:chairy_app/features/categories/data/repositories/product_repository_impl.dart';
import 'package:chairy_app/features/categories/domain/usecases/get_categories.dart';
import 'package:chairy_app/features/categories/domain/usecases/get_products_by_category_id.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void registerSharedPreferences() {
  getIt.registerSingleton<MySharedPreferences>(MySharedPreferences());
}

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService());

  getIt
      .registerSingleton<ApiDBServices>(ApiDBServices(getIt.get<ApiService>()));

  getIt.registerSingleton<CategoryRemoteDataSourceImpl>(
    CategoryRemoteDataSourceImpl(getIt.get<ApiDBServices>()),
  );

  getIt.registerSingleton<CategoryLocalDataSourceImpl>(
    CategoryLocalDataSourceImpl(),
  );

  getIt.registerSingleton<CategoryRepositoryImpl>(
    CategoryRepositoryImpl(getIt.get<CategoryRemoteDataSourceImpl>(),
        getIt.get<CategoryLocalDataSourceImpl>()),
  );

  getIt.registerSingleton<GetCategories>(
    GetCategories(getIt.get<CategoryRepositoryImpl>()),
  );

  getIt.registerSingleton<ProductRemoteDataSourceImpl>(
    ProductRemoteDataSourceImpl(getIt.get<ApiDBServices>()),
  );

  getIt.registerSingleton<ProductLocalDataSourceImpl>(
    ProductLocalDataSourceImpl(),
  );

  getIt.registerSingleton<ProductRepositoryImpl>(
    ProductRepositoryImpl(getIt.get<ProductRemoteDataSourceImpl>(),
        getIt.get<ProductLocalDataSourceImpl>()),
  );

  getIt.registerSingleton<GetProductsByCategoryId>(
    GetProductsByCategoryId(getIt.get<ProductRepositoryImpl>()),
  );

  getIt.registerSingleton<ApiAuthServices>(
      ApiAuthServices(getIt.get<ApiService>()));

  getIt.registerSingleton<AuthRemoteDataSourceImpl>(
      AuthRemoteDataSourceImpl(getIt.get<ApiAuthServices>()));

  getIt.registerSingleton<AuthRepositoryImpl>(
      AuthRepositoryImpl(getIt.get<AuthRemoteDataSourceImpl>()));

  getIt.registerSingleton<Register>(Register(getIt.get<AuthRepositoryImpl>()));
  
  getIt.registerSingleton<Login>(Login(getIt.get<AuthRepositoryImpl>()));
}
