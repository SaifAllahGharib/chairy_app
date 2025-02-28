import 'package:chairy_app/core/shared/cubits/theme_cubit/theme_cubit.dart';
import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/core/utils/service_locator.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/data_view.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/details_order_view.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/payment_view.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/register_view.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/review_view.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/top_section_auth_view.dart';
import 'package:chairy_app/features/auth/presentaion/viewmodel/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthViewBody extends StatefulWidget {
  final List<CartEntity> cart;

  const AuthViewBody({super.key, required this.cart});

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
            child: _getCurrentView(),
          ),
        ),
      ],
    );
  }

  Widget _getCurrentView() {
    final prefs = getIt.get<MySharedPreferences>();
    final bool isUserLoggedIn = prefs.userIsLogin();
    final bool hasAddressData = prefs.getString("city")?.isNotEmpty == true &&
        prefs.getString("street_name")?.isNotEmpty == true &&
        prefs.getString("building_number")?.isNotEmpty == true;

    int index = context.watch<AuthCubit>().currentView;

    if (index == 0) {
      if (isUserLoggedIn && hasAddressData) {
        index = 2;
        context.read<AuthCubit>().changeStep(index);
      } else if (isUserLoggedIn) {
        index = 1;
        context.read<AuthCubit>().changeStep(index);
      }
    }

    switch (index) {
      case 0:
        return RegisterView(
          isDark: _isDark,
          index: index,
          cart: widget.cart,
        );
      case 1:
        return DataView(isDark: _isDark, index: index);
      case 2:
        return PaymentView(isDark: _isDark);
      case 3:
        return DetailsOrderView(
          isDark: _isDark,
          cart: widget.cart,
          index: index,
        );
      case 4:
        return ReviewView(isDark: _isDark);
      default:
        return const SizedBox.shrink();
    }
  }
}
