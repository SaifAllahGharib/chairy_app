import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/more_info_widget.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class CategoryItemListView extends StatelessWidget {
  const CategoryItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(Dimensions.radius23),
          child: Image.asset(AppAssets.test),
        ),
        SizedBox(height: Dimensions.height30),
        SizedBox(
          width: Dimensions.height277,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).livingRoom,
                softWrap: true,
                style: Styles.textStyle24,
              ),
              SizedBox(height: Dimensions.height20),
              Text(
                "Sofas, loveseats, armchairs, coffee tables, end tables, entertainment centers, bookshelves.",
                style: Styles.textStyle16.copyWith(
                  fontWeight: FontWeight.w300,
                  color: AppColors.darkGray,
                ),
              ),
              SizedBox(height: Dimensions.height14),
              const MoreInfoWidget(),
              SizedBox(height: Dimensions.height20),
            ],
          ),
        ),
      ],
    );
  }
}
