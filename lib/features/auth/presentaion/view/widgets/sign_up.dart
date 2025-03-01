import 'package:chairy_app/core/helper_functions/snack_bar.dart';
import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/core/utils/service_locator.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/core/widgets/custom_button.dart';
import 'package:chairy_app/core/widgets/loading.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/custom_form_with_text_form.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/or_widget.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/policy_and_check_box_section.dart';
import 'package:chairy_app/features/auth/presentaion/viewmodel/auth/auth_cubit.dart';
import 'package:chairy_app/features/auth/presentaion/viewmodel/auth/auth_state.dart';
import 'package:chairy_app/features/home/presentation/views/widgets/custom_icon_button.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatefulWidget {
  final bool isDark;
  final int index;
  final List<CartEntity> cart;

  const SignUp({
    super.key,
    required this.isDark,
    required this.index,
    required this.cart,
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
                  S.of(context).iAmNewToThisStore,
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.w400,
                    color: widget.isDark ? AppColors.white : AppColors.black,
                  ),
                ),
                Text(
                  S.of(context).enjoyExclusiveDiscountsOffers,
                  style: Styles.textStyle10.copyWith(
                    fontWeight: FontWeight.w400,
                    color: widget.isDark ? AppColors.white : AppColors.black,
                  ),
                ),
                SizedBox(height: Dimensions.height50),
                CustomFormWithTextForm(
                  isDark: widget.isDark,
                  formState: _formState,
                  firstName: _firstName,
                  lastName: _lastName,
                  email: _email,
                  password: _password,
                ),
                SizedBox(height: Dimensions.height10),
                PolicyAndCheckBoxSection(isDark: widget.isDark),
                const Spacer(),
                CustomButton(
                  text: S.of(context).signUp,
                  onclick: () => _register(),
                ),
                SizedBox(height: Dimensions.height15),
                OrWidget(isDark: widget.isDark),
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
