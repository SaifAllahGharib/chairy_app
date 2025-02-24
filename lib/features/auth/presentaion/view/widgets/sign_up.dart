import 'package:chairy_app/core/helper_functions/snack_bar.dart';
import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/core/utils/type_field.dart';
import 'package:chairy_app/core/widgets/custom_button.dart';
import 'package:chairy_app/core/widgets/loading.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/custom_text_form_field.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/or_widget.dart';
import 'package:chairy_app/features/auth/presentaion/viewmodel/auth/auth_cubit.dart';
import 'package:chairy_app/features/auth/presentaion/viewmodel/auth/auth_state.dart';
import 'package:chairy_app/features/home/presentation/views/widgets/custom_icon_button.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatefulWidget {
  final bool isDark;
  final int index;

  const SignUp({
    super.key,
    required this.isDark,
    required this.index,
  });

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late GlobalKey<FormState> _formState;
  late final TextEditingController _firstName;
  late final TextEditingController _lastName;
  late final TextEditingController _email;
  late final TextEditingController _password;

  AuthCubit get authCubit => context.watch<AuthCubit>();

  @override
  void initState() {
    _formState = GlobalKey<FormState>();

    _firstName = TextEditingController();
    _lastName = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _email.dispose();
    _password.dispose();

    super.dispose();
  }

  String? _setError(TypeField type, String errorMsg, String? value,
      [String? secErrorEmailMsg]) {
    return context
        .read<AuthCubit>()
        .setError(type: type, errorMsg: errorMsg, value: value);
  }

  void _register() {
    if (_formState.currentState!.validate()) {
      _formState.currentState!.save();

      context.read<AuthCubit>().register(
            _firstName.text,
            _lastName.text,
            _email.text,
            _password.text,
          );
    }
  }

  void _handelState(state) {
    if (state is AuthSuccessState) {
      snackBar(
        context: context,
        text: S.of(context).registerSuccess,
        color: AppColors.primaryColor,
      );
    } else if (state is AuthFailureState) {
      snackBar(
        context: context,
        text: state.failure.message,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) => _handelState(state),
      builder: (context, state) {
        if (state is AuthLoadingState) {
          return const Loading();
        }

        return Padding(
          padding: EdgeInsets.only(
            top: Dimensions.height36 * 1.4,
            left: Dimensions.height20,
            bottom: Dimensions.height73,
            right: Dimensions.height20,
          ),
          child: Container(
            padding: EdgeInsets.all(Dimensions.height20),
            decoration: BoxDecoration(
              color: widget.isDark ? AppColors.darkColor : AppColors.bgRegister,
              borderRadius: BorderRadius.circular(Dimensions.radius15),
            ),
            child: Column(
              children: [
                Text(
                  S.of(context).iAmNewToThisStore,
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.w400,
                    color: widget.isDark ? AppColors.white : AppColors.black,
                  ),
                ),
                Text(
                  S.of(context).enjoyEexclusive,
                  style: Styles.textStyle10.copyWith(
                    fontWeight: FontWeight.w400,
                    color: widget.isDark ? AppColors.white : AppColors.black,
                  ),
                ),
                SizedBox(height: Dimensions.height50),
                Form(
                  key: _formState,
                  child: Expanded(
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: _firstName,
                          isDark: widget.isDark,
                          hint: S.of(context).firstName,
                          icon: AppAssets.name,
                          hasError: authCubit.hasFirstNameError,
                          onSaved: (newValue) {},
                          validator: (String? newValue) => _setError(
                            TypeField.firstName,
                            S.of(context).required,
                            newValue,
                          ),
                        ),
                        SizedBox(height: Dimensions.height10),
                        CustomTextFormField(
                          controller: _lastName,
                          isDark: widget.isDark,
                          onSaved: (newValue) {},
                          hint: S.of(context).lastName,
                          icon: AppAssets.name,
                          hasError: authCubit.hasLastNameError,
                          validator: (String? newValue) => _setError(
                            TypeField.lastName,
                            S.of(context).required,
                            newValue,
                          ),
                        ),
                        SizedBox(height: Dimensions.height10),
                        CustomTextFormField(
                          controller: _email,
                          isDark: widget.isDark,
                          onSaved: (newValue) {},
                          hint: S.of(context).emailAddress,
                          hasError: authCubit.hasEmailError,
                          icon: AppAssets.email,
                          validator: (String? newValue) => _setError(
                            TypeField.email,
                            S.of(context).required,
                            newValue,
                            S.of(context).invalidEmail,
                          ),
                        ),
                        SizedBox(height: Dimensions.height10),
                        CustomTextFormField(
                          controller: _password,
                          isDark: widget.isDark,
                          onSaved: (newValue) {},
                          isPassword: true,
                          hasError: authCubit.hasPasswordError,
                          hint: S.of(context).password,
                          icon: AppAssets.lock,
                          validator: (String? newValue) => _setError(
                            TypeField.password,
                            S.of(context).required,
                            newValue,
                          ),
                        ),
                        const Spacer(),
                        CustomButton(
                          text: S.of(context).signUp,
                          onclick: () => _register(),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: Dimensions.height10),
                OrWidget(isDark: widget.isDark),
                SizedBox(height: Dimensions.height10),
                Text(
                  S.of(context).signUpWithGoogle,
                  style: Styles.textStyle10.copyWith(
                    fontWeight: FontWeight.w500,
                    color: widget.isDark ? AppColors.white : AppColors.black,
                  ),
                ),
                SizedBox(height: Dimensions.height15),
                CustomIconButton(
                  onClick: () {},
                  icon: AppAssets.google,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
