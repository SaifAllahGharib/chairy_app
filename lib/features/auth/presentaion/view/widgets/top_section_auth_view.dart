import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/horizontal_stepper.dart';
import 'package:chairy_app/features/home/presentation/views/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopSectionAuthView extends StatefulWidget {
  final bool isDark;

  const TopSectionAuthView({super.key, required this.isDark});

  @override
  State<TopSectionAuthView> createState() => _TopSectionAuthViewState();
}

class _TopSectionAuthViewState extends State<TopSectionAuthView> {
  int _currentStep = 0;
  final List<String> steps = ["REGISTER", "DATA", "PAYMENT", "REVIEW"];
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Dimensions.height50,
        left: Dimensions.width30,
        right: Dimensions.width30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(widget.isDark ? AppAssets.logo : AppAssets.darkLogo),
          SizedBox(height: Dimensions.height50),
          CustomIconButton(
            onClick: () => GoRouter.of(context).pop(),
            icon: AppAssets.arrowBack,
          ),
          SizedBox(height: Dimensions.height20),
          HorizontalStepper(
            currentStep: _currentStep,
            steps: steps,
          ),
        ],
      ),
    );
  }
}
