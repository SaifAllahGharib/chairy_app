import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/custom_divider.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class OrWidget extends StatelessWidget {
  final bool isDark;

  const OrWidget({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomDivider(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.height10),
          child: Text(
            S.of(context).or,
            style: Styles.textStyle10.copyWith(
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.white : AppColors.black,
            ),
          ),
        ),
        const CustomDivider(),
      ],
    );
  }
}
