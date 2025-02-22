import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/core/widgets/custom_app_bar.dart';
import 'package:chairy_app/features/menu/presentation/view/widgets/choose_widget.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class LangSection extends StatelessWidget {
  const LangSection({super.key});

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
          CustomAppBar(
            searchOrMenu: true,
            bottom: Dimensions.height50,
          ),
          SizedBox(height: Dimensions.height50),
          Text(
            S.of(context).menu,
            style: Styles.textStyle32,
          ),
          SizedBox(height: Dimensions.height36),
          Text(
            S.of(context).language,
            style: Styles.textStyle20,
          ),
          SizedBox(height: Dimensions.height20),
          Column(
            children: [
              ChooseWidget(
                selected: false,
                text: S.of(context).ar,
                icon: AppAssets.eg,
              ),
              SizedBox(height: Dimensions.height10 * 0.8),
              const Divider(),
              SizedBox(height: Dimensions.height10 * 0.7),
              ChooseWidget(
                selected: true,
                text: S.of(context).en,
                icon: AppAssets.us,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
