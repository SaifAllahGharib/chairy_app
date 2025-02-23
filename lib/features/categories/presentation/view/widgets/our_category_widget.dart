import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/core/viewmodels/local_cubit/local.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OurCategoryWidget extends StatelessWidget {
  final bool isDark;
  final bool isArabic;

  const OurCategoryWidget({
    super.key,
    required this.isDark,
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
          top: Dimensions.height50,
          left: context.read<LocalCubit>().isArabic ? 0 : Dimensions.height20,
          right: context.read<LocalCubit>().isArabic ? Dimensions.height20 : 0,
          bottom: Dimensions.height50,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${S.of(context).our}\n${S.of(context).categories}",
              style: Styles.textStyle42.copyWith(
                color: isDark ? AppColors.white : AppColors.black,
              ),
            ),
            isArabic
                ? const SizedBox.shrink()
                : Flexible(
                    fit: FlexFit.loose,
                    child: Image.asset(
                      AppAssets.ourCategory1,
                      // width: double.infinity,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
