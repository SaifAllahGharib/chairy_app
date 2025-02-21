import 'package:chairy_app/core/helper_functions/init_app.dart';
import 'package:chairy_app/core/utils/app_router.dart';
import 'package:chairy_app/core/utils/app_themes.dart';
import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/core/utils/service_locator.dart';
import 'package:chairy_app/core/viewmodels/local_cubit/local.dart';
import 'package:chairy_app/core/viewmodels/theme_cubit/theme_cubit.dart';
import 'package:chairy_app/core/viewmodels/theme_cubit/theme_state.dart';
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
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => LocalCubit(getIt.get<MySharedPreferences>()),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return BlocBuilder<LocalCubit, Locale>(
            builder: (context, local) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                theme: AppThemes.lightTheme,
                darkTheme: AppThemes.darkTheme,
                themeMode: state.themeMode,
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
