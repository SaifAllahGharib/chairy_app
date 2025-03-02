import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/search_type.dart';
import 'package:chairy_app/core/widgets/custom_app_bar.dart';
import 'package:chairy_app/features/home/presentation/views/widgets/text_section.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.bgHome,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Column(
          children: [
            CustomAppBar(
              bottom: Dimensions.height50,
              searchType: SearchType.categories,
              searchOrMenu: true,
            ),
            SizedBox(height: Dimensions.height132),
            const TextSection(),
          ],
        ),
      ],
    );
  }
}
