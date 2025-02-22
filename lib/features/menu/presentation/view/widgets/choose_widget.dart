import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ChooseWidget extends StatelessWidget {
  final String text;
  final String icon;
  final bool selected;

  const ChooseWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          SizedBox(
            width: Dimensions.width50,
            child: selected
                ? Image.asset(AppAssets.check)
                : const SizedBox.shrink(),
          ),
          SizedBox(width: Dimensions.width30),
          Image.asset(icon),
          SizedBox(width: Dimensions.width20),
          Text(
            text,
            style: Styles.textStyle12.copyWith(
              fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
              fontSize:
                  selected ? Dimensions.fontSize14 : Dimensions.fontSize12,
            ),
          )
        ],
      ),
    );
  }
}
