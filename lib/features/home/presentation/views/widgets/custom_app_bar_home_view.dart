import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/features/home/presentation/views/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class CustomAppBarHomeView extends StatelessWidget {
  final void Function() onClickSearch;
  final void Function() onClickMenu;

  const CustomAppBarHomeView({
    super.key,
    required this.onClickSearch,
    required this.onClickMenu,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(AppAssets.logo),
        Row(
          children: [
            CustomIconButton(
              onClick: onClickSearch,
              icon: AppAssets.search,
            ),
            SizedBox(width: Dimensions.width27),
            CustomIconButton(
              onClick: onClickMenu,
              icon: AppAssets.menu,
            ),
          ],
        ),
      ],
    );
  }
}
