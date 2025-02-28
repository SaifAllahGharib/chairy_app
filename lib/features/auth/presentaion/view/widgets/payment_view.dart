import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/core/utils/service_locator.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/core/widgets/custom_button.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/custom_radio_tile.dart';
import 'package:chairy_app/features/auth/presentaion/viewmodel/auth/auth_cubit.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'customer_text_section.dart';

class PaymentView extends StatelessWidget {
  final bool isDark;

  const PaymentView({super.key, required this.isDark});

  void _selectPayment(BuildContext context, String value) {
    context.read<AuthCubit>().selectPaymentMethod(value);
  }

  void _goToDetailsOrder(BuildContext context) {
    context.read<AuthCubit>().changeView();
    getIt.get<MySharedPreferences>().storeString(
          "payment",
          context.watch<AuthCubit>().selectedValue,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomerTextSection(isDark: isDark),
        SizedBox(height: Dimensions.height36),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.height20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: Dimensions.width20),
                child: Text(
                  S.of(context).selectPaymentMethod,
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isDark ? AppColors.white : AppColors.black,
                  ),
                ),
              ),
              SizedBox(height: Dimensions.height30),
              CustomRadioTile(
                onChanged: (value) => _selectPayment(context, value!),
                selectedValue: context.watch<AuthCubit>().selectedValue,
                isDark: isDark,
                value: "card",
                title: S.of(context).cardPayment,
              ),
              CustomRadioTile(
                onChanged: (value) => _selectPayment(context, value!),
                selectedValue: context.watch<AuthCubit>().selectedValue,
                isDark: isDark,
                value: "paypal",
                title: S.of(context).paypal,
                paypal: true,
              ),
            ],
          ),
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.height20),
          child: CustomButton(
            text: S.of(context).next,
            onclick: () => _goToDetailsOrder(context),
          ),
        ),
        SizedBox(height: Dimensions.height20),
      ],
    );
  }
}
