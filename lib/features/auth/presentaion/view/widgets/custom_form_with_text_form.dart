import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/type_field.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/custom_text_form_field.dart';
import 'package:chairy_app/features/auth/presentaion/viewmodel/auth/auth_cubit.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomFormWithTextForm extends StatefulWidget {
  final bool isDark;
  final GlobalKey<FormState> formState;
  final TextEditingController firstName;
  final TextEditingController lastName;
  final TextEditingController email;
  final TextEditingController password;

  const CustomFormWithTextForm({
    super.key,
    required this.isDark,
    required this.formState,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  @override
  State<CustomFormWithTextForm> createState() => _CustomFormWithTextFormState();
}

class _CustomFormWithTextFormState extends State<CustomFormWithTextForm> {
  String? _setError(TypeField type, String errorMsg, String? value,
      [String? secErrorEmailMsg]) {
    return context
        .read<AuthCubit>()
        .setError(type: type, errorMsg: errorMsg, value: value);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formState,
      child: Column(
        children: [
          CustomTextFormField(
            controller: widget.firstName,
            isDark: widget.isDark,
            onSaved: (newValue) {},
            hint: S.of(context).firstName,
            typeField: TypeField.firstName,
            hasError: context.watch<AuthCubit>().hasEmailError,
            validator: (String? newValue) => _setError(
              TypeField.firstName,
              S.of(context).required,
              newValue,
            ),
          ),
          SizedBox(height: Dimensions.height15),
          CustomTextFormField(
            controller: widget.lastName,
            isDark: widget.isDark,
            onSaved: (newValue) {},
            hint: S.of(context).lastName,
            typeField: TypeField.lastName,
            hasError: context.watch<AuthCubit>().hasEmailError,
            validator: (String? newValue) => _setError(
              TypeField.lastName,
              S.of(context).required,
              newValue,
            ),
          ),
          SizedBox(height: Dimensions.height15),
          CustomTextFormField(
            controller: widget.email,
            isDark: widget.isDark,
            onSaved: (newValue) {},
            hint: S.of(context).emailAddress,
            typeField: TypeField.email,
            hasError: context.watch<AuthCubit>().hasEmailError,
            validator: (String? newValue) => _setError(
              TypeField.email,
              S.of(context).required,
              newValue,
              S.of(context).invalidEmail,
            ),
          ),
          SizedBox(height: Dimensions.height15),
          CustomTextFormField(
            controller: widget.password,
            isDark: widget.isDark,
            isPassword: true,
            showPassword: context.watch<AuthCubit>().showPassword,
            hasError: context.watch<AuthCubit>().hasPasswordError,
            hint: S.of(context).password,
            typeField: TypeField.password,
            onSaved: (newValue) {},
            validator: (String? newValue) => _setError(
              TypeField.password,
              S.of(context).required,
              newValue,
            ),
          ),
        ],
      ),
    );
  }
}
