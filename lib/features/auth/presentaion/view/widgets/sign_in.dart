import 'package:chairy_app/core/helper_functions/snack_bar.dart';
import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/core/utils/service_locator.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/core/utils/type_field.dart';
import 'package:chairy_app/core/widgets/custom_button.dart';
import 'package:chairy_app/core/widgets/loading.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/custom_text_form_field.dart';
import 'package:chairy_app/features/auth/presentaion/viewmodel/auth/auth_cubit.dart';
import 'package:chairy_app/features/auth/presentaion/viewmodel/auth/auth_state.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatefulWidget {
  final bool isDark;
  final int index;
  final List<CartEntity> cart;

  const SignIn({
    super.key,
    required this.isDark,
    required this.index,
    required this.cart,
  });

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late final GlobalKey<FormState> _formState;
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _formState = GlobalKey<FormState>();
    _email = TextEditingController();
    _password = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
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

  void _login() {
    if (_formState.currentState!.validate()) {
      _formState.currentState!.save();

      context.read<AuthCubit>().login(
            _email.text,
            _password.text,
          );
    }
  }

  void _authSuccess(state) async {
    snackBar(
      context: context,
      text: S.of(context).registerSuccess,
      color: AppColors.primaryColor,
    );

    context.read<AuthCubit>().changeStep(widget.index + 1);

    context.read<AuthCubit>().changeView();

    await Future.wait([
      getIt.get<MySharedPreferences>().storeString(
            "token",
            "${state.user.token}",
          ),
      context.read<AuthCubit>().syncCartWithServer(
            widget.cart,
            state.user.token,
          ),
    ]);
  }

  void _handelState(state) async {
    if (state is AuthSuccessState) {
      _authSuccess(state);
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
            bottom: Dimensions.height63,
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
                  S.of(context).iAmAlreadyACustomer,
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.w400,
                    color: widget.isDark ? AppColors.white : AppColors.black,
                  ),
                ),
                SizedBox(height: Dimensions.height50),
                Form(
                  key: _formState,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: _email,
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
                      CustomTextFormField(
                        controller: _password,
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
                ),
                const Spacer(),
                CustomButton(
                  text: S.of(context).signIn,
                  onclick: () => _login(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
