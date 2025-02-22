import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/features/home/presentation/views/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      onClick: () => GoRouter.of(context).pop(),
      icon: AppAssets.close,
    );
  }
}
