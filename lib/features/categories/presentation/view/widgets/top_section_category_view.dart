import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/widgets/custom_app_bar.dart';
import 'package:chairy_app/core/widgets/custom_cached_network_image.dart';
import 'package:flutter/material.dart';

class TopSectionProductsCategoryView extends StatelessWidget {
  final bool isDark;
  final String image;

  const TopSectionProductsCategoryView(
      {super.key, required this.isDark, required this.image});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          CustomAppBar(
            darkLogo: true,
            searchOrMenu: true,
            bottom: Dimensions.height50,
          ),
          Container(
            height: Dimensions.height277 * 1.4,
            margin: EdgeInsets.symmetric(horizontal: Dimensions.width30),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: Dimensions.height277,
                    height: Dimensions.height277,
                    decoration: BoxDecoration(
                      color:
                          isDark ? AppColors.darkColor : AppColors.lightColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius10),
                    ),
                  ),
                ),
                Positioned(
                  // alignment: Alignment.bottomRight,
                  bottom: Dimensions.height73 * 1.37,
                  right: 0,
                  child: Container(
                    width: Dimensions.height277,
                    height: Dimensions.height145 * 1.3,
                    decoration: BoxDecoration(
                      color:
                          isDark ? AppColors.darkColor : AppColors.lightColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius10),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: Dimensions.width63,
                      vertical: Dimensions.height30,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(Dimensions.radius23),
                      child: CustomCachedNetworkImage(image: image),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
