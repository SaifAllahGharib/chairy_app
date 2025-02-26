import 'package:chairy_app/core/shared/cubits/theme_cubit/theme_cubit.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/data_view.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/register_view.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/top_section_auth_view.dart';
import 'package:chairy_app/features/auth/presentaion/viewmodel/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthViewBody extends StatefulWidget {
  const AuthViewBody({super.key});

  @override
  State<AuthViewBody> createState() => _AuthViewBodyState();
}

class _AuthViewBodyState extends State<AuthViewBody> {
  bool get _isDark => context.watch<ThemeCubit>().isDark;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopSectionAuthView(isDark: _isDark),
          SizedBox(height: Dimensions.height50),
          IntrinsicHeight(
            child: IndexedStack(
              index: context.watch<AuthCubit>().currentView,
              children: [
                RegisterView(
                  isDark: _isDark,
                  index: context.watch<AuthCubit>().currentView,
                ),
                const DataView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
