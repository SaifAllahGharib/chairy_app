import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/features/menu/presentation/view/widgets/lang_section.dart';
import 'package:chairy_app/features/menu/presentation/view/widgets/theme_section.dart';
import 'package:flutter/material.dart';

class MenuViewBody extends StatelessWidget {
  const MenuViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const LangSection(),
          Divider(
            thickness: Dimensions.height14,
            color: AppColors.gray,
          ),
          const ThemeSection(),
        ],
      ),
    );
  }
}
