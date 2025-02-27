import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/bringing_text.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/custom_tab_bar.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/sign_in.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/sign_up.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  final bool isDark;
  final int index;

  const RegisterView({
    super.key,
    required this.isDark,
    required this.index,
  });

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
                      color: isDark ? AppColors.white : AppColors.black,
                    ),
                  ),
                  BringingText(isDark: isDark),
                ],
              ),
            ),
            SizedBox(height: Dimensions.height20),
            CustomTabBar(isDark: isDark),
            SizedBox(
              height: Dimensions.height500 * 1.4,
              child: TabBarView(
                children: [
                  SignIn(isDark: isDark, index: index),
                  SignUp(isDark: isDark, index: index),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
