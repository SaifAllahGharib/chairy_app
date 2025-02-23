import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/core/widgets/custom_cached_network_image.dart';
import 'package:chairy_app/features/categories/domain/entities/category.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/more_info_widget.dart';
import 'package:flutter/material.dart';

class CategoriesItemListView extends StatelessWidget {
  final Category category;
  final bool isDark;

  const CategoriesItemListView(
      {super.key, required this.category, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.height50),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(Dimensions.radius23),
            child: CustomCachedNetworkImage(image: category.image),
          ),
          SizedBox(height: Dimensions.height30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category.title,
                softWrap: true,
                style: Styles.textStyle24.copyWith(
                  color: isDark ? AppColors.white : AppColors.darkGray,
                ),
              ),
              SizedBox(height: Dimensions.height20),
              Text(
                category.description,
                style: Styles.textStyle16.copyWith(
                  fontWeight: FontWeight.w300,
                  color: isDark ? AppColors.white : AppColors.darkGray,
                ),
              ),
              SizedBox(height: Dimensions.height14),
              const MoreInfoWidget(),
              SizedBox(height: Dimensions.height20),
            ],
          ),
        ],
      ),
    );
  }
}
