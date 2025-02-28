import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/core/utils/service_locator.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/custom_container_edit.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class RowDetailsPaymentAndAddress extends StatelessWidget {
  final bool isDark;

  const RowDetailsPaymentAndAddress({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomContainerEdit(
          isDark: isDark,
          title: S.of(context).deliveryaddress,
          content: Text(
            "Egypt\n${getIt.get<MySharedPreferences>().getString("city")}\n${getIt.get<MySharedPreferences>().getString("street_name")}",
            style: Styles.textStyle16.copyWith(
              fontWeight: FontWeight.w400,
              color: isDark ? AppColors.white : AppColors.black,
            ),
            softWrap: true,
          ),
        ),
        SizedBox(width: Dimensions.width30),
        CustomContainerEdit(
          isDark: isDark,
          title: S.of(context).payment,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).cardPayment,
                style: Styles.textStyle15.copyWith(
                  fontWeight: FontWeight.w400,
                  color: isDark ? AppColors.white : AppColors.black,
                ),
                softWrap: true,
              ),
              SizedBox(height: Dimensions.height20),
              Image.asset(AppAssets.masterCard),
            ],
          ),
        ),
      ],
    );
  }
}
