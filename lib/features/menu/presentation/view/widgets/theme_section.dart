import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/features/menu/presentation/view/widgets/choose_widget.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class ThemeSection extends StatelessWidget {
  const ThemeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.height20,
        right: Dimensions.height20,
        top: Dimensions.height50,
        bottom: Dimensions.height14,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).theme,
            style: Styles.textStyle32,
          ),
          SizedBox(height: Dimensions.height20),
          Column(
            children: [
              ChooseWidget(
                selected: true,
                text: S.of(context).lightMode,
                icon: AppAssets.light,
              ),
              SizedBox(height: Dimensions.height10 * 0.8),
              const Divider(),
              SizedBox(height: Dimensions.height10 * 0.7),
              ChooseWidget(
                selected: false,
                text: S.of(context).darkMode,
                icon: AppAssets.dark,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
