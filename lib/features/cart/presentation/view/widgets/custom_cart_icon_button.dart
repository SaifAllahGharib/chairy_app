import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:flutter/material.dart';

class CustomCartIconButton extends StatelessWidget {
  final void Function() onClick;
  final IconData icon;

  const CustomCartIconButton({
    super.key,
    required this.onClick,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      enableFeedback: false,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(Dimensions.width10),
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            icon,
            size: Dimensions.iconSize16,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
