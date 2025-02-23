import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/viewmodels/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        context.watch<ThemeCubit>().isDark
            ? AppAssets.darkSplash
            : AppAssets.splash,
      ),
    );
  }
}
