import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

void snackBar({
  required BuildContext context,
  required String text,
  Color color = AppColors.red,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      backgroundColor: color,
      duration: const Duration(milliseconds: 2500),
    ),
  );
}
