import 'package:chairy_app/core/shared/cubits/local_cubit/local.dart';
import 'package:chairy_app/core/shared/cubits/theme_cubit/theme_cubit.dart';
import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/core/widgets/custom_app_bar.dart';
import 'package:chairy_app/features/menu/presentation/view/widgets/choose_widget.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LangSection extends StatefulWidget {
  const LangSection({super.key});

  @override
  State<LangSection> createState() => _LangSectionState();
}

class _LangSectionState extends State<LangSection> {
  bool get _isArabic => context.watch<LocalCubit>().isArabic;

  bool get _isDark => context.watch<ThemeCubit>().isDark;

  void _changeLang(String lang) {
    context.read<LocalCubit>().changeLanguage(lang);
  }

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
            style: Styles.textStyle32.copyWith(
              color: _isDark ? AppColors.white : AppColors.black,
            ),
          ),
          SizedBox(height: Dimensions.height36),
          Text(
            S.of(context).language,
            style: Styles.textStyle20.copyWith(
              color: _isDark ? AppColors.white : AppColors.black,
            ),
          ),
          SizedBox(height: Dimensions.height20),
          Column(
            children: [
              ChooseWidget(
                selected: _isArabic,
                text: S.of(context).ar,
                icon: AppAssets.eg,
                onClick: () => _changeLang("ar"),
              ),
              SizedBox(height: Dimensions.height10 * 0.8),
              const Divider(),
              SizedBox(height: Dimensions.height10 * 0.7),
              ChooseWidget(
                selected: !_isArabic,
                text: S.of(context).en,
                icon: AppAssets.us,
                onClick: () => _changeLang("en"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
