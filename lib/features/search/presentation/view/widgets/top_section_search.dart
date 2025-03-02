import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class TopSectionSearch extends StatelessWidget {
  final bool isDark;

  const TopSectionSearch({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Dimensions.height50),
        Text(
          S.of(context).chicStore,
          textAlign: TextAlign.center,
          style: Styles.textStyle32.copyWith(
            color: isDark ? AppColors.white : AppColors.black,
          ),
        ),
        SizedBox(height: Dimensions.height10),
        Text(
          S.of(context).discoverRoom,
          style: Styles.textStyle20.copyWith(
            color: isDark ? AppColors.white : AppColors.black,
          ),
        )
      ],
    );
  }
}
