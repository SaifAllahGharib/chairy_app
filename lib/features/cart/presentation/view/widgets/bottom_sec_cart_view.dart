import 'package:chairy_app/core/helper_functions/snack_bar.dart';
import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/internet_connectivity.dart';
import 'package:chairy_app/core/utils/local_notification_service.dart';
import 'package:chairy_app/core/utils/service_locator.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/core/widgets/custom_button.dart';
import 'package:chairy_app/features/auth/presentaion/view/auth_view.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class BottomSecCartView extends StatelessWidget {
  final bool isDark;
  final List<CartEntity> cart;

  const BottomSecCartView({
    super.key,
    required this.isDark,
    required this.cart,
  });

  void _placeOrder(BuildContext context) async {
    if (await getIt.get<InternetConnectivity>().isConnected) {
      GoRouter.of(context).push(
        AuthView.id,
        extra: cart,
      );

      GetIt.I<LocalNotificationService>().showNotification(
        id: 1,
        title: "E-Commerce",
        body:
            "${S.of(context).iWantToBuy} ${cart[0].quantity} ${cart[0].title}",
      );
    } else {
      snackBar(
        context: context,
        text: S.of(context).pleaseCheckYourNetwork,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.height20),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            SizedBox(height: Dimensions.height15),
            const Divider(),
            SizedBox(height: Dimensions.height15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).total,
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.w400,
                    color: isDark ? AppColors.white : AppColors.semiDarkBlack,
                  ),
                ),
                Text(
                  "43,96 €",
                  style: Styles.textStyle20.copyWith(
                    color: isDark ? AppColors.white : AppColors.darkBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: Dimensions.height15),
            CustomButton(
              text: S.of(context).placeOrder,
              onclick: () => _placeOrder(context),
            ),
            SizedBox(height: Dimensions.height15),
          ],
        ),
      ),
    );
  }
}
