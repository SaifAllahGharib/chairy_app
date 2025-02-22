import 'dart:ui';

import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BlurWidget extends StatelessWidget {
  const BlurWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: Dimensions.height66,
                  height: Dimensions.height66,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.3),
                  ),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(Dimensions.height63 / 2),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 11, sigmaY: 11),
                      child: Container(),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: Dimensions.width18,
                    vertical: Dimensions.height36,
                  ),
                  height: Dimensions.height239,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(Dimensions.height63 / 2),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 11, sigmaY: 11),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.width63),
                        child: Column(
                          children: [
                            SizedBox(height: Dimensions.height44),
                            Text(
                              "Extensive Catalog",
                              textAlign: TextAlign.center,
                              style: Styles.textStyle18,
                            ),
                            SizedBox(height: Dimensions.height30),
                            Text(
                              "A wide selection of furniture styles, categories, and price points.",
                              textAlign: TextAlign.center,
                              style: Styles.textStyle14.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.darkGray,
                              ),
                            ),
                            SizedBox(height: Dimensions.height63),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
