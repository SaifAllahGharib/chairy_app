import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/core/utils/hive_service.dart';
import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/core/utils/service_locator.dart';
import 'package:chairy_app/features/categories/domain/entities/category_entity.dart';
import 'package:chairy_app/features/categories/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();

  await Hive.initFlutter();

  Hive.registerAdapter(CategoryEntityAdapter());
  Hive.registerAdapter(ProductEntityAdapter());
  Hive.registerAdapter(CartEntityAdapter());

  await Future.wait([
    getIt.get<MySharedPreferences>().init(),
    getIt.get<HiveService>().initBox<CategoryEntity>("categories_box"),
    getIt.get<HiveService>().initBox<ProductEntity>("products_box"),
    getIt.get<HiveService>().initBox<CartEntity>("cart_box"),
  ]);
}
