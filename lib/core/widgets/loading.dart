import 'package:chairy_app/core/shared/cubits/theme_cubit/theme_cubit.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool get _isDark => context.watch<ThemeCubit>().isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _isDark ? AppColors.black : AppColors.white,
      child: Center(
        child: LoadingAnimationWidget.stretchedDots(
          color: AppColors.primaryColor,
          size: Dimensions.height73 * 1.2,
        ),
      ),
    );
  }
}
