import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/features/auth/presentaion/viewmodel/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/styles.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool isDark;
  final bool isPassword;
  final bool showPassword;
  final String? icon;
  final String hint;
  final bool hasError;
  final bool isCompleted;
  final void Function(String? newValue) onSaved;
  final String? Function(String? newValue) validator;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.onSaved,
    required this.hint,
    this.icon,
    this.isPassword = false,
    this.showPassword = false,
    this.hasError = false,
    this.isCompleted = false,
    required this.validator,
    required this.isDark,
  });

  void _showPassword(BuildContext context) {
    context.read<AuthCubit>().toggleShowPassword();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height30,
      child: TextFormField(
        controller: controller,
        obscureText: showPassword,
        onSaved: onSaved,
        maxLines: 1,
        validator: validator,
        style: Styles.textStyle16
            .copyWith(color: isDark ? AppColors.white : AppColors.black),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: Styles.hintStyle
              .copyWith(color: isDark ? AppColors.white : AppColors.black),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: isDark ? AppColors.white : AppColors.black,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: isDark ? AppColors.white : AppColors.black,
            ),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.red,
            ),
          ),
          suffix: isPassword
              ? IconButton(
                  onPressed: () => _showPassword(context),
                  icon: Icon(
                    Icons.remove_red_eye_outlined,
                    size: Dimensions.iconSize20,
                  ),
                )
              : hasError
                  ? Image.asset(AppAssets.wrong)
                  : isCompleted
                      ? Icon(
                          Icons.check,
                          size: Dimensions.height30,
                          color: AppColors.green,
                        )
                      : null,
          // suffixIcon: ,
          icon: icon == null ? null : Image.asset(icon!),
        ),
      ),
    );
  }
}
