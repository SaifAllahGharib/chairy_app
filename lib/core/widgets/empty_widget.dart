import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(AppAssets.emptyCart),
    );
  }
}
