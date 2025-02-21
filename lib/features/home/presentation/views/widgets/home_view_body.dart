import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/features/home/presentation/views/widgets/custom_app_bar_home_view.dart';
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
        Padding(
          padding: EdgeInsets.only(
            top: Dimensions.height44,
            right: Dimensions.height20,
            left: Dimensions.height20,
          ),
          child: Column(
            children: [
              CustomAppBarHomeView(
                onClickSearch: () {},
                onClickMenu: () {},
              ),
              SizedBox(height: Dimensions.height132),
              const TextSection(),
            ],
          ),
        ),
      ],
    );
  }
}
