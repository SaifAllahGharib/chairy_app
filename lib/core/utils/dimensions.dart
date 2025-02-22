import 'package:flutter/material.dart';

abstract class Dimensions {
  static final MediaQueryData _mediaQuery = MediaQueryData.fromView(
    WidgetsBinding.instance.platformDispatcher.views.first,
  );

  static final double screenHeight = _mediaQuery.size.height;
  static final double screenWidth = _mediaQuery.size.width;

  // Dynamic Height Padding and Margin
  static final double height10 = screenHeight / 84.4;
  static final double height12 = screenHeight / 70;
  static final double height14 = screenHeight / 60.28;
  static final double height15 = screenHeight / 56.27;
  static final double height20 = screenHeight / 42.2;
  static final double height30 = screenHeight / 28.13;
  static final double height36 = screenHeight / 23.44;
  static final double height44 = screenHeight / 19.09;
  static final double height50 = screenHeight / 16.88;
  static final double height63 = screenHeight / 13.4;
  static final double height66 = screenHeight / 12.72;
  static final double height73 = screenHeight / 11.5;
  static final double height132 = screenHeight / 6.39;
  static final double height145 = screenHeight / 7.01;
  static final double height239 = screenHeight / 3.76;
  static final double height277 = screenHeight / 3.2;
  static final double height500 = screenHeight / 1.728;

  // Dynamic Width Padding and Margin
  static final double width10 = screenWidth / 84.4;
  static final double width15 = screenWidth / 56.27;
  static final double width18 = screenWidth / 46.88;
  static final double width20 = screenWidth / 42.2;
  static final double width27 = screenWidth / 31.11;
  static final double width30 = screenWidth / 28.13;
  static final double width34 = screenWidth / 24.7;
  static final double width50 = screenWidth / 20;
  static final double width63 = screenWidth / 13.4;
  static final double width73 = screenWidth / 11.5;
  static final double width277 = screenWidth / 3.61;

  // Dynamic Font Size
  static final double fontSize10 = screenHeight / 84;
  static final double fontSize12 = screenHeight / 70;
  static final double fontSize14 = screenHeight / 60.28;
  static final double fontSize15 = screenHeight / 56.27;
  static final double fontSize16 = screenHeight / 52.75;
  static final double fontSize18 = screenHeight / 46.88;
  static final double fontSize20 = screenHeight / 42.2;
  static final double fontSize24 = screenHeight / 35;
  static final double fontSize30 = screenHeight / 28.13;
  static final double fontSize32 = screenHeight / 26.25;
  static final double fontSize36 = screenHeight / 23.44;
  static final double fontSize42 = screenHeight / 20;

  // Dynamic Radius
  static final double radius10 = screenHeight / 77.6;
  static final double radius15 = screenHeight / 56.27;
  static final double radius20 = screenHeight / 42.2;
  static final double radius23 = screenHeight / 36.52;
  static final double radius30 = screenHeight / 28.13;

  // Dynamic Icon Size
  static final double iconSize16 = screenHeight / 52.75;
  static final double iconSize20 = screenHeight / 42.2;
  static final double iconSize24 = screenHeight / 35.17;
  static final double iconSize30 = screenHeight / 28.13;
  static final double iconSize45 = screenHeight / 21.17;
}
