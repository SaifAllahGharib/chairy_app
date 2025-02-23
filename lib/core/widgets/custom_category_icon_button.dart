import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:flutter/material.dart';

class CustomCategoryIconButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final bool isDark;
  final void Function() onClick;

  const CustomCategoryIconButton({
    super.key,
    required this.icon,
    required this.color,
    required this.onClick,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onClick,
        icon: Icon(
          icon,
          color: isDark ? AppColors.black : AppColors.white,
          size: Dimensions.iconSize30,
        ),
      ),
    );
  }
}
