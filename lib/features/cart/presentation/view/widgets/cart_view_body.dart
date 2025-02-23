import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/core/viewmodels/local_cubit/local.dart';
import 'package:chairy_app/core/viewmodels/theme_cubit/theme_cubit.dart';
import 'package:chairy_app/core/widgets/custom_app_bar.dart';
import 'package:chairy_app/core/widgets/custom_button.dart';
import 'package:chairy_app/features/cart/presentation/view/widgets/custom_cart_icon_button.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/price_widget.dart';
import 'package:chairy_app/features/home/presentation/views/widgets/custom_icon_button.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  bool get _isDark => context.watch<ThemeCubit>().isDark;

  bool get _isArabic => context.watch<LocalCubit>().isArabic;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: CustomAppBar(darkLogo: true)),
        SliverToBoxAdapter(
          child: Stack(
            children: [
              Center(child: Image.asset(AppAssets.bgCart)),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(height: Dimensions.height100),
                    Text(
                      S.of(context).yourCart,
                      style: Styles.textStyle36.copyWith(
                        color: _isDark ? AppColors.white : AppColors.black,
                      ),
                    ),
                    Text(
                      S.of(context).reviewYourItems,
                      style: Styles.textStyle16.copyWith(
                        fontWeight: FontWeight.w400,
                        color: _isDark ? AppColors.white : AppColors.lightBlack,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.height20),
          sliver: SliverList.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Image.asset(
                    AppAssets.chair,
                    width: Dimensions.height132,
                    height: Dimensions.height132,
                  ),
                  SizedBox(width: Dimensions.width20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Baltsar Chair",
                              style: Styles.textStyle16.copyWith(
                                fontWeight: FontWeight.w500,
                                color: _isDark
                                    ? AppColors.white
                                    : AppColors.lightBlack,
                              ),
                            ),
                            PriceWidget(
                              isDark: _isDark,
                              price: 50,
                              fontSizeIcon: Dimensions.fontSize14,
                              fontSizePrice: Dimensions.fontSize20,
                            ),
                          ],
                        ),
                        Text(
                          "About the Chair",
                          style: Styles.textStyle10.copyWith(
                            fontWeight: FontWeight.w400,
                            color: _isDark
                                ? AppColors.white
                                : AppColors.lightBlack,
                          ),
                        ),
                        Row(
                          children: [
                            CustomIconButton(
                              onClick: () {},
                              icon: AppAssets.delete,
                            ),
                            SizedBox(width: Dimensions.width34),
                            CustomCartIconButton(
                              onClick: () {},
                              icon: Icons.add,
                            ),
                            SizedBox(width: Dimensions.width20),
                            Text(
                              "1",
                              style: Styles.textStyle12.copyWith(
                                color:
                                    _isDark ? AppColors.white : AppColors.black,
                              ),
                            ),
                            SizedBox(width: Dimensions.width20),
                            CustomCartIconButton(
                              onClick: () {},
                              icon: Icons.remove,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        SliverPadding(
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
                        color:
                            _isDark ? AppColors.white : AppColors.semiDarkBlack,
                      ),
                    ),
                    Text(
                      "43,96 €",
                      style: Styles.textStyle20.copyWith(
                        color: _isDark ? AppColors.white : AppColors.darkBlue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.height15),
                CustomButton(
                  text: S.of(context).placeOrder,
                  onclick: () {},
                ),
                SizedBox(height: Dimensions.height15),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
