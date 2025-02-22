import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/core/viewmodels/local_cubit/local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OurCategoryWidget extends StatelessWidget {
  const OurCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
          left: context.read<LocalCubit>().isArabic ? 0 : Dimensions.height20,
          right: context.read<LocalCubit>().isArabic ? Dimensions.height20 : 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Our\nCategories",
              style: Styles.textStyle42,
            ),
            Flexible(
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
