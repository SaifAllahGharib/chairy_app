import 'package:chairy_app/core/services/api_db-services.dart';
import 'package:chairy_app/core/services/api_services.dart';
import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/features/categories/data/data_sources/category_remote_data_source.dart';
import 'package:chairy_app/features/categories/data/repositories/category_repository_impl.dart';
import 'package:chairy_app/features/categories/domain/usecases/get_categories.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void registerSharedPreferences() {
  getIt.registerSingleton<MySharedPreferences>(MySharedPreferences());
}

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService());

  getIt
      .registerSingleton<ApiDBServices>(ApiDBServices(getIt.get<ApiService>()));

  getIt.registerSingleton<CategoryRemoteDataSource>(
    CategoryRemoteDataSourceImpl(getIt.get<ApiDBServices>()),
  );

  getIt.registerSingleton<CategoryRepositoryImpl>(
    CategoryRepositoryImpl(getIt.get<CategoryRemoteDataSource>()),
  );

  getIt.registerSingleton<GetCategories>(
    GetCategories(getIt.get<CategoryRepositoryImpl>()),
  );
}
