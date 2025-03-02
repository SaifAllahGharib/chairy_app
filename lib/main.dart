import 'package:chairy_app/core/helper_functions/init_app.dart';
import 'package:chairy_app/core/shared/cubits/counter/counter_cubit.dart';
import 'package:chairy_app/core/shared/cubits/local_cubit/local.dart';
import 'package:chairy_app/core/shared/cubits/theme_cubit/theme_cubit.dart';
import 'package:chairy_app/core/shared/usecases/decrease_item.dart';
import 'package:chairy_app/core/shared/usecases/increase_item.dart';
import 'package:chairy_app/core/utils/app_router.dart';
import 'package:chairy_app/core/utils/app_themes.dart';
import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/core/utils/service_locator.dart';
import 'package:chairy_app/features/cart/domain/usecases/get_items_from_cart.dart';
import 'package:chairy_app/features/cart/domain/usecases/remove_item_from_cart.dart';
import 'package:chairy_app/features/cart/presentation/viewmodel/cart/cart_cubit.dart';
import 'package:chairy_app/features/categories/domain/usecases/get_categories.dart';
import 'package:chairy_app/features/categories/domain/usecases/get_products_by_category_id.dart';
import 'package:chairy_app/features/categories/presentation/viewmodel/categories/categories_cubit.dart';
import 'package:chairy_app/features/categories/presentation/viewmodel/products/products_cubit.dart';
import 'package:chairy_app/features/main/presentation/viewmodel/main/main_cubit.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  await initApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(getIt.get<MySharedPreferences>()),
        ),
        BlocProvider(
          create: (context) => LocalCubit(getIt.get<MySharedPreferences>()),
        ),
        BlocProvider(
          create: (context) => MainCubit(),
        ),
        BlocProvider(
          create: (context) => CategoriesCubit(getIt.get<GetCategories>()),
        ),
        BlocProvider(
          create: (context) =>
              ProductsCategoryCubit(getIt.get<GetProductsByCategoryId>()),
        ),
        BlocProvider(
          create: (context) => CounterCubit(
            getIt.get<IncreaseItem>(),
            getIt.get<DecreaseItem>(),
            getIt.get<MySharedPreferences>(),
          ),
        ),
        BlocProvider(
          create: (context) => CartCubit(
            getIt.get<GetItemsFromCart>(),
            getIt.get<RemoveItemFromCart>(),
            getIt.get<MySharedPreferences>(),
          ),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return BlocBuilder<LocalCubit, Locale>(
            builder: (context, local) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                theme: AppThemes.lightTheme,
                darkTheme: AppThemes.darkTheme,
                themeMode: themeMode,
                locale: local,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                routerConfig: AppRouter.router,
              );
            },
          );
        },
      ),
    );
  }
}
