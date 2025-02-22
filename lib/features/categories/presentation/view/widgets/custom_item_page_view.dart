import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/blur_widget.dart';
import 'package:flutter/material.dart';

class CustomItemPageView extends StatelessWidget {
  const CustomItemPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: Dimensions.width50),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(Dimensions.radius20),
            child: Image.asset(
              AppAssets.bgSlider,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          const BlurWidget(),
        ],
      ),
    );
  }
}
