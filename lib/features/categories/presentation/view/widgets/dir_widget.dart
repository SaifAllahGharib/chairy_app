import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class DirWidget extends StatelessWidget {
  final String firstText;
  final String? secText;

  const DirWidget({
    super.key,
    required this.firstText,
    this.secText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width50),
      child: Row(
        children: [
          Text(
            S.of(context).categories,
            style: Styles.textStyle15,
          ),
          SizedBox(width: Dimensions.width15),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: Dimensions.width30,
            color: AppColors.primaryColor,
          ),
          SizedBox(width: Dimensions.width15),
          Text(
            firstText,
            style: Styles.textStyle15,
          ),
          SizedBox(width: Dimensions.width15),
          secText != null
              ? Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: Dimensions.width30,
                  color: AppColors.primaryColor,
                )
              : const SizedBox.shrink(),
          secText != null
              ? SizedBox(width: Dimensions.width15)
              : const SizedBox.shrink(),
          secText != null
              ? Text(
                  "$secText",
                  style: Styles.textStyle15,
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
