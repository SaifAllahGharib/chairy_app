import 'package:chairy_app/core/shared/cubits/theme_cubit/theme_cubit.dart';
import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/search_type.dart';
import 'package:chairy_app/core/widgets/custom_close_button.dart';
import 'package:chairy_app/features/home/presentation/views/widgets/custom_icon_button.dart';
import 'package:chairy_app/features/menu/presentation/view/menu_view.dart';
import 'package:chairy_app/features/search/presentation/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatefulWidget {
  final bool searchOrMenu;
  final SearchType? searchType;
  final bool darkLogo;
  final double bottom;

  const CustomAppBar({
    super.key,
    this.searchOrMenu = false,
    this.searchType,
    this.darkLogo = false,
    this.bottom = 0,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool get _isDark => context.watch<ThemeCubit>().isDark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Dimensions.height50,
        left: Dimensions.height20,
        right: Dimensions.height20,
        bottom: widget.bottom,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            widget.darkLogo
                ? _isDark
                    ? AppAssets.logo
                    : AppAssets.darkLogo
                : AppAssets.logo,
          ),
          !widget.searchOrMenu
              ? const CustomCloseButton()
              : Row(
                  children: [
                    CustomIconButton(
                      onClick: () => GoRouter.of(context).push(
                        SearchView.id,
                        extra: widget.searchType,
                      ),
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
