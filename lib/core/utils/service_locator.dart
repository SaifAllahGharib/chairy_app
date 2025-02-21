import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void registerSharedPreferences() {
  getIt.registerSingleton<MySharedPreferences>(MySharedPreferences());
}

void setupServiceLocator() {}
