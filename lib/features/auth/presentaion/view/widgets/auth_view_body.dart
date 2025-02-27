import 'package:chairy_app/core/shared/cubits/theme_cubit/theme_cubit.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/data_view.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/payment_view.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/register_view.dart';
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopSectionAuthView(isDark: _isDark),
        SizedBox(height: Dimensions.height50),
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            child: _getCurrentView(2),
          ),
        ),
      ],
    );
  }

  Widget _getCurrentView(int index) {
    switch (index) {
      case 0:
        return RegisterView(isDark: _isDark, index: index);
      case 1:
        return DataView(isDark: _isDark);
      case 2:
        return PaymentView(isDark: _isDark);
      default:
        return const SizedBox.shrink();
    }
  }
}
