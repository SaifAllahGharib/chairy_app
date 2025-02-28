import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/bringing_text.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/custom_tab_bar.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/sign_in.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/sign_up.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  final bool isDark;
  final int index;
  final List<CartEntity> cart;

  const RegisterView({
    super.key,
    required this.isDark,
    required this.index,
    required this.cart,
  });

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width50),
              child: Column(
                children: [
                  Text(
                    S.of(context).welcomeToOurStore,
                    textAlign: TextAlign.center,
                    style: Styles.textStyle36.copyWith(
                      color: widget.isDark ? AppColors.white : AppColors.black,
                    ),
                  ),
                  BringingText(isDark: widget.isDark),
                ],
              ),
            ),
            SizedBox(height: Dimensions.height20),
            CustomTabBar(isDark: widget.isDark),
            SizedBox(
              height: Dimensions.height500 * 1.45,
              child: TabBarView(
                children: [
                  SignIn(
                    isDark: widget.isDark,
                    index: widget.index,
                    cart: widget.cart,
                  ),
                  SignUp(
                    isDark: widget.isDark,
                    index: widget.index,
                    cart: widget.cart,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
