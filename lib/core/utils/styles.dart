import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:flutter/material.dart';

abstract class Styles {
  static final TextStyle textStyle10 = TextStyle(
    fontSize: Dimensions.fontSize10,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );

  static final TextStyle textStyle12 = TextStyle(
    fontSize: Dimensions.fontSize12,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );

  static final TextStyle textStyle14 = TextStyle(
    fontSize: Dimensions.fontSize14,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor,
  );

  static final TextStyle textStyle15 = TextStyle(
    fontSize: Dimensions.fontSize15,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryColor,
  );

  static final TextStyle textStyle16 = TextStyle(
    fontSize: Dimensions.fontSize16,
    fontWeight: FontWeight.w800,
  );

  static final TextStyle textStyle18 = TextStyle(
    fontSize: Dimensions.fontSize18,
    fontWeight: FontWeight.w400,
    color: AppColors.darkGray,
  );

  static final TextStyle textStyle20 = TextStyle(
    fontSize: Dimensions.fontSize20,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle textStyle24 = TextStyle(
    fontSize: Dimensions.fontSize24,
    color: AppColors.darkGray,
    fontWeight: FontWeight.w800,
  );

  static final TextStyle textStyle32 = TextStyle(
    fontSize: Dimensions.fontSize32,
    fontWeight: FontWeight.w800,
    color: AppColors.black,
  );

  static final TextStyle textStyle36 = TextStyle(
    fontSize: Dimensions.fontSize36,
    fontWeight: FontWeight.w800,
  );

  static final TextStyle textStyle42 = TextStyle(
    fontSize: Dimensions.fontSize42,
    color: AppColors.darkGray,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle hintStyle = TextStyle(
    fontWeight: FontWeight.w300,
    color: AppColors.black,
  );

  static final TextStyle errorStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: Dimensions.fontSize30,
    color: Colors.red,
  );
}
