import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomRadioTile extends StatelessWidget {
  final void Function(String? value) onChanged;
  final String? selectedValue;
  final String value;
  final String title;
  final bool paypal;
  final bool isDark;

  const CustomRadioTile({
    super.key,
    required this.selectedValue,
    required this.onChanged,
    required this.value,
    required this.title,
    required this.isDark,
    this.paypal = false,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      value: value,
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w400,
          color: isDark ? AppColors.white : AppColors.black,
          fontSize: Styles.textStyle16.fontSize,
        ),
      ),
      enableFeedback: false,
      activeColor: AppColors.primaryColor,
      secondary: paypal
          ? Image.asset(AppAssets.paypal)
          : SizedBox(
              width: Dimensions.width73 * 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    AppAssets.visa,
                    width: Dimensions.height20,
                  ),
                  SizedBox(width: Dimensions.width30),
                  Image.asset(
                    AppAssets.masterCard,
                    width: Dimensions.height20,
                  ),
                ],
              ),
            ),
      groupValue: selectedValue,
      onChanged: onChanged,
    );
  }
}
