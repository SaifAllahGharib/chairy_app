import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/features/home/presentation/views/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final void Function() onClickHome;
  final void Function() onClickCategory;
  final void Function() onClickCart;

  const CustomBottomNavBar({
    super.key,
    required this.onClickHome,
    required this.onClickCategory,
    required this.onClickCart,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width50 * 2,
          vertical: Dimensions.height14,
        ),
        decoration: BoxDecoration(
          color: AppColors.bgNavigationBar,
          boxShadow: [
            BoxShadow(
              color: const Color(0x64ffffff),
              spreadRadius: Dimensions.height50 * 2,
              blurRadius: 35,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIconButton(
                onClick: onClickHome,
                icon: AppAssets.activeHome,
              ),
              CustomIconButton(
                onClick: onClickCategory,
                icon: AppAssets.category,
              ),
              CustomIconButton(
                onClick: onClickCart,
                icon: AppAssets.cart,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
