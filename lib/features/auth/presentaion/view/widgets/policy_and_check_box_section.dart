import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/features/auth/presentaion/viewmodel/auth/auth_cubit.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PolicyAndCheckBoxSection extends StatelessWidget {
  final bool isDark;

  const PolicyAndCheckBoxSection({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: Dimensions.height20,
              height: Dimensions.height20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: AppColors.gray,
              ),
              child: Checkbox(
                value: context.watch<AuthCubit>().checkBoxValue,
                activeColor: AppColors.primaryColor,
                checkColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                ),
                side: const BorderSide(
                  width: 0,
                  color: Colors.transparent,
                ),
                onChanged: (value) => context.read<AuthCubit>().setCheckBox(),
              ),
            ),
            SizedBox(width: Dimensions.width15),
            Expanded(
              child: Text(
                S.of(context).policyCheckBoxText,
                style: Styles.textStyle10.copyWith(
                  fontWeight: FontWeight.w400,
                  color: isDark ? AppColors.white : AppColors.black,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: Dimensions.height20),
        RichText(
          text: TextSpan(
            text: S.of(context).theTermsAndConditionsText,
            style: Styles.textStyle10.copyWith(
              fontWeight: FontWeight.w400,
              color: isDark ? AppColors.white : AppColors.black,
            ),
            children: [
              TextSpan(
                text: S.of(context).privacyInformation,
                style: Styles.textStyle10.copyWith(
                  fontWeight: FontWeight.w400,
                  color: isDark ? AppColors.white : AppColors.black,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
