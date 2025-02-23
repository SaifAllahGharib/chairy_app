import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/viewmodels/theme_cubit/theme_cubit.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/Data.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/register.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/top_section_auth_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthViewBody extends StatefulWidget {
  const AuthViewBody({super.key});

  @override
  State<AuthViewBody> createState() => _AuthViewBodyState();
}

class _AuthViewBodyState extends State<AuthViewBody> {
  bool get _isDark => context.watch<ThemeCubit>().isDark;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopSectionAuthView(isDark: _isDark),
        SizedBox(height: Dimensions.height50),
        IndexedStack(
          index: index,
          children: [
            Register(isDark: _isDark),
            const Data(),
          ],
        ),
      ],
    );
  }
}
