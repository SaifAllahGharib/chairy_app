import 'package:chairy_app/core/shared/cubits/theme_cubit/theme_cubit.dart';
import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/features/main/presentation/viewmodel/main/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int index;
  final void Function(int index) onIndexChanged;

  const CustomBottomNavBar({
    super.key,
    required this.onIndexChanged,
    required this.index,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.width50 * 2,
        vertical: Dimensions.height14,
      ),
      decoration: BoxDecoration(
        color: context.watch<ThemeCubit>().isDark
            ? AppColors.bgDarkNavigationBar
            : AppColors.bgNavigationBar,
        boxShadow: widget.index == 0
            ? [
                BoxShadow(
                  color: const Color(0x8effffff),
                  spreadRadius: Dimensions.height50 * 3,
                  blurRadius: 50,
                  offset: const Offset(0, 5),
                ),
              ]
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          3,
          (index) {
            return InkWell(
              onTap: () => widget.onIndexChanged(index),
              child: _buildIcon(
                index: index,
                isSelected: index == context.read<MainCubit>().selectedIndex,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildIcon({required int index, required bool isSelected}) {
    final List<String> icons = [
      AppAssets.home,
      AppAssets.category,
      AppAssets.cart,
    ];

    final List<String> activeIcons = [
      AppAssets.activeHome,
      AppAssets.activeCategory,
      AppAssets.activeCart,
    ];

    return Image.asset(
      isSelected ? activeIcons[index] : icons[index],
    );
  }
}
