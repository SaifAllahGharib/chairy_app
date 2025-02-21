import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final void Function() onClick;
  final String icon;

  const CustomIconButton({
    super.key,
    required this.onClick,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Image.asset(
        icon,
        width: Dimensions.iconSize30,
        height: Dimensions.iconSize30,
      ),
    );
  }
}
