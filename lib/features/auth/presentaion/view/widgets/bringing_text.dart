import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class BringingText extends StatelessWidget {
  final bool isDark;

  const BringingText({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).bringingYourStyleHome,
      textAlign: TextAlign.center,
      style: Styles.textStyle16.copyWith(
        color: isDark ? AppColors.white : AppColors.black,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
