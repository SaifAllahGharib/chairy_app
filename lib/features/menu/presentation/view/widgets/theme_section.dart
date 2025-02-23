import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/core/viewmodels/theme_cubit/theme_cubit.dart';
import 'package:chairy_app/features/menu/presentation/view/widgets/choose_widget.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeSection extends StatefulWidget {
  const ThemeSection({super.key});

  @override
  State<ThemeSection> createState() => _ThemeSectionState();
}

class _ThemeSectionState extends State<ThemeSection> {
  bool get _isDark => context.watch<ThemeCubit>().isDark;

  void _changeTheme(BuildContext context, ThemeMode mode) {
    context.read<ThemeCubit>().changeTheme(mode);
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
          Text(
            S.of(context).theme,
            style: Styles.textStyle20.copyWith(
              color: _isDark ? AppColors.white : AppColors.black,
            ),
          ),
          SizedBox(height: Dimensions.height20),
          Column(
            children: [
              ChooseWidget(
                selected: !_isDark,
                text: S.of(context).lightMode,
                icon: AppAssets.light,
                onClick: () => _changeTheme(context, ThemeMode.light),
              ),
              SizedBox(height: Dimensions.height10 * 0.8),
              const Divider(),
              SizedBox(height: Dimensions.height10 * 0.7),
              ChooseWidget(
                selected: _isDark,
                text: S.of(context).darkMode,
                icon: AppAssets.dark,
                onClick: () => _changeTheme(context, ThemeMode.dark),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
