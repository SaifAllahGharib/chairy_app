import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/core/widgets/custom_button.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/custom_text_form_field.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/customer_text_section.dart';
import 'package:flutter/material.dart';

class DataView extends StatefulWidget {
  final bool isDark;

  const DataView({super.key, required this.isDark});

  @override
  State<DataView> createState() => _DataViewState();
}

class _DataViewState extends State<DataView> {
  late final TextEditingController _city;
  late final TextEditingController _street;
  late final TextEditingController _buildingNumber;

  @override
  void initState() {
    _city = TextEditingController();
    _street = TextEditingController();
    _buildingNumber = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _city.dispose();
    _street.dispose();
    _buildingNumber.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomerTextSection(isDark: widget.isDark),
          SizedBox(height: Dimensions.height50),
          Padding(
            padding: EdgeInsets.all(Dimensions.height20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Delivery address",
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.w600,
                    color: widget.isDark ? AppColors.white : AppColors.black,
                  ),
                ),
                SizedBox(height: Dimensions.height73),
                Form(
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: _city,
                        isDark: widget.isDark,
                        validator: (newValue) {},
                        onSaved: (newValue) {},
                        hint: "city",
                      ),
                      SizedBox(height: Dimensions.height10),
                      CustomTextFormField(
                        controller: _street,
                        isDark: widget.isDark,
                        validator: (newValue) {},
                        onSaved: (newValue) {},
                        hint: "Street Name",
                      ),
                      SizedBox(height: Dimensions.height10),
                      CustomTextFormField(
                        isDark: widget.isDark,
                        controller: _buildingNumber,
                        validator: (newValue) {},
                        onSaved: (newValue) {},
                        hint: "Building Number",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Dimensions.height100),
                CustomButton(
                  text: "Next",
                  onclick: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
