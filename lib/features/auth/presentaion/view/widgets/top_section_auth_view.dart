import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/horizontal_stepper.dart';
import 'package:chairy_app/features/auth/presentaion/viewmodel/auth/auth_cubit.dart';
import 'package:chairy_app/features/home/presentation/views/widgets/custom_icon_button.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TopSectionAuthView extends StatelessWidget {
  final bool isDark;

  const TopSectionAuthView({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final List<String> steps = [
      S.of(context).register,
      S.of(context).data,
      S.of(context).payment,
      S.of(context).review,
    ];

    return Padding(
      padding: EdgeInsets.only(
        top: Dimensions.height50,
        left: Dimensions.width30,
        right: Dimensions.width30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(isDark ? AppAssets.logo : AppAssets.darkLogo),
          SizedBox(height: Dimensions.height50),
          CustomIconButton(
            onClick: () => GoRouter.of(context).pop(),
            icon: AppAssets.arrowBack,
          ),
          SizedBox(height: Dimensions.height20),
          HorizontalStepper(
            isDark: isDark,
            currentStep: context.watch<AuthCubit>().currentStep,
            steps: steps,
          ),
        ],
      ),
    );
  }
}
