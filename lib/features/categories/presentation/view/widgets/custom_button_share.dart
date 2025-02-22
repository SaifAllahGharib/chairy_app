import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:flutter/material.dart';

class CustomButtonShare extends StatelessWidget {
  const CustomButtonShare({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: Dimensions.height36,
        child: Image.asset(
          AppAssets.share,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
