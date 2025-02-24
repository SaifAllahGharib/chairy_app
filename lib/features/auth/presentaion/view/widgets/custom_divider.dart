import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Divider(
        color: AppColors.gray,
      ),
    );
  }
}
