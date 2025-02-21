import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/core/utils/service_locator.dart';
import 'package:flutter/material.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  registerSharedPreferences();

  await getIt.get<MySharedPreferences>().init();

  setupServiceLocator();
}
