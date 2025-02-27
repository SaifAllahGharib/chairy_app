import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/core/widgets/custom_button.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/custom_radio_tile.dart';
import 'package:flutter/material.dart';

import 'customer_text_section.dart';

class PaymentView extends StatefulWidget {
  final bool isDark;

  const PaymentView({super.key, required this.isDark});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  String? _selectedValue = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomerTextSection(isDark: widget.isDark),
        SizedBox(height: Dimensions.height36),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.height20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: Dimensions.width20),
                child: Text(
                  "select payment methoda",
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.w600,
                    color: widget.isDark ? AppColors.white : AppColors.black,
                  ),
                ),
              ),
              SizedBox(height: Dimensions.height30),
              CustomRadioTile(
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value;
                  });
                },
                selectedValue: _selectedValue,
                isDark: widget.isDark,
                value: "visa",
                title: "Card Payment",
              ),
              CustomRadioTile(
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value;
                  });
                },
                selectedValue: _selectedValue,
                isDark: widget.isDark,
                value: "paypal",
                title: "Paypal",
                paypal: true,
              ),
              // SizedBox(height: Dimensions.height100),
              // const Spacer(),
            ],
          ),
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.height20),
          child: CustomButton(
            text: "Next",
            onclick: () {},
          ),
        ),
        SizedBox(height: Dimensions.height20),
      ],
    );
  }
}
