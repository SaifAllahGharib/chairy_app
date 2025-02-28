import 'package:chairy_app/core/helper_functions/snack_bar.dart';
import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/core/utils/service_locator.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/core/widgets/custom_button.dart';
import 'package:chairy_app/core/widgets/loading.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/custom_list_view_shopping_cart.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/customer_text_section.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/row_details_payment_and_address.dart';
import 'package:chairy_app/features/auth/presentaion/viewmodel/auth/auth_cubit.dart';
import 'package:chairy_app/features/auth/presentaion/viewmodel/auth/auth_state.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/price_widget.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsOrderView extends StatelessWidget {
  final bool isDark;
  final int index;
  final List<CartEntity> cart;

  const DetailsOrderView({
    super.key,
    required this.isDark,
    required this.cart,
    required this.index,
  });

  void _handleState(BuildContext context, state) {
    if (state is AuthCreateOrderState) {
      print("ORDER: ${state.order.sessionUrl}");

      snackBar(
        context: context,
        text: "Create order success",
        color: AppColors.primaryColor,
      );

      context.read<AuthCubit>().changeStep(index + 1);

      context.read<AuthCubit>().changeView();
    } else if (state is AuthCreateOrderFailureState) {
      snackBar(context: context, text: state.failure.message);
    }
  }

  void _createOrder(BuildContext context) {
    context.read<AuthCubit>().createOrder(
          getIt.get<MySharedPreferences>().getUserToken(),
          getIt.get<MySharedPreferences>().getString("street_name") ?? "Cairo",
          getIt.get<MySharedPreferences>().getString("city") ?? "Cairo",
          "Egypt",
          context.watch<AuthCubit>().selectedValue,
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) => _handleState(context, state),
      builder: (context, state) {
        if (state is AuthLoadingState) {
          return const Loading();
        }

        return SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomerTextSection(isDark: isDark),
                SizedBox(height: Dimensions.height36),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: Dimensions.height20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).reviewOrder,
                        style: Styles.textStyle16.copyWith(
                          fontWeight: FontWeight.w600,
                          color: isDark ? AppColors.white : AppColors.black,
                        ),
                      ),
                      Text(
                        S
                            .of(context)
                            .dearCustomerPleaseCheckYourInformationForAccuracy,
                        style: Styles.textStyle12.copyWith(
                          fontWeight: FontWeight.w400,
                          color: isDark ? AppColors.white : AppColors.darkGray,
                        ),
                      ),
                      SizedBox(height: Dimensions.height20),
                      RowDetailsPaymentAndAddress(isDark: isDark),
                      SizedBox(height: Dimensions.height20),
                      CustomListViewShoppingCart(
                        isDark: isDark,
                        cart: cart,
                      ),
                      SizedBox(height: Dimensions.height20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            S.of(context).total,
                            style: Styles.textStyle16.copyWith(
                              fontWeight: FontWeight.w400,
                              color: isDark
                                  ? AppColors.white
                                  : AppColors.semiDarkBlack,
                            ),
                          ),
                          SizedBox(width: Dimensions.width20),
                          PriceWidget(
                            price: 5,
                            isDark: isDark,
                          ),
                        ],
                      ),
                      SizedBox(height: Dimensions.height30),
                      CustomButton(
                        text: S.of(context).placeOrder,
                        onclick: () => _createOrder(context),
                      ),
                      SizedBox(height: Dimensions.height30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
