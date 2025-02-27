import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/bringing_text.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomerTextSection extends StatelessWidget {
  final bool isDark;

  const CustomerTextSection({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width50),
      child: Column(
        children: [
          Text(
            S.of(context).yourCustomerDataForTheOrder,
            textAlign: TextAlign.center,
            style: Styles.textStyle36.copyWith(
              color: isDark ? AppColors.white : AppColors.black,
            ),
          ),
          BringingText(isDark: isDark),
        ],
      ),
    );
  }
}
