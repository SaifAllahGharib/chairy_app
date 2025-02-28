import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/custom_edit_button.dart';
import 'package:flutter/material.dart';

class CustomContainerEdit extends StatelessWidget {
  final bool isDark;
  final String title;
  final Widget content;

  const CustomContainerEdit({
    super.key,
    required this.isDark,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Styles.textStyle15.copyWith(
              fontWeight: FontWeight.w700,
              color: isDark ? AppColors.white : AppColors.black,
            ),
          ),
          SizedBox(height: Dimensions.height20),
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: Dimensions.height239 * 0.85,
            ),
            child: Container(
              padding: EdgeInsets.all(Dimensions.height15),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkColor : AppColors.lightGray,
                borderRadius: BorderRadius.circular(Dimensions.radius23),
              ),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    content,
                    SizedBox(height: Dimensions.height20),
                    CustomEditButton(
                      onClick: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
