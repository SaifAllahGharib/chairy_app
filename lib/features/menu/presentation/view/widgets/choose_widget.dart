import 'package:chairy_app/core/shared/cubits/theme_cubit/theme_cubit.dart';
import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseWidget extends StatelessWidget {
  final String text;
  final String icon;
  final bool selected;
  final void Function() onClick;

  const ChooseWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.selected,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
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
              color: context.watch<ThemeCubit>().isDark
                  ? Colors.white
                  : Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
