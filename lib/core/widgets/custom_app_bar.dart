import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/widgets/custom_close_button.dart';
import 'package:chairy_app/features/home/presentation/views/widgets/custom_icon_button.dart';
import 'package:chairy_app/features/menu/presentation/view/menu_view.dart';
import 'package:chairy_app/features/search/presentation/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  final bool searchOrMenu;
  final bool darkLogo;

  const CustomAppBar({
    super.key,
    this.searchOrMenu = false,
    this.darkLogo = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Dimensions.height50,
        left: Dimensions.height20,
        right: Dimensions.height20,
        bottom: Dimensions.height50,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
              searchOrMenu || darkLogo ? AppAssets.darkLogo : AppAssets.logo),
          searchOrMenu
              ? const CustomCloseButton()
              : Row(
                  children: [
                    CustomIconButton(
                      onClick: () => GoRouter.of(context).push(SearchView.id),
                      icon: AppAssets.search,
                    ),
                    SizedBox(width: Dimensions.width27),
                    CustomIconButton(
                      onClick: () => GoRouter.of(context).push(MenuView.id),
                      icon: AppAssets.menu,
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
