import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/core/utils/service_locator.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/core/utils/type_field.dart';
import 'package:chairy_app/core/widgets/custom_button.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/custom_text_form_field.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/customer_text_section.dart';
import 'package:chairy_app/features/auth/presentaion/viewmodel/auth/auth_cubit.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataView extends StatefulWidget {
  final bool isDark;
  final int index;

  const DataView({
    super.key,
    required this.isDark,
    required this.index,
  });

  @override
  State<DataView> createState() => _DataViewState();
}

class _DataViewState extends State<DataView> {
  late final GlobalKey<FormState> _formState;
  late final TextEditingController _city;
  late final TextEditingController _street;
  late final TextEditingController _buildingNumber;

  @override
  void initState() {
    _formState = GlobalKey<FormState>();
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

  String? _setError(TypeField type, String errorMsg, String? value,
      [String? secErrorEmailMsg]) {
    return context
        .read<AuthCubit>()
        .setError(type: type, errorMsg: errorMsg, value: value);
  }

  void _saveAddress() async {
    final prefs = getIt.get<MySharedPreferences>();

    if (_formState.currentState!.validate()) {
      _formState.currentState!.save();

      context.read<AuthCubit>().changeStep(widget.index + 1);
      context.read<AuthCubit>().changeView();

      await Future.wait([
        prefs.storeString("city", _city.text.trim()),
        prefs.storeString("street_name", _street.text.trim()),
        prefs.storeString("building_number", _buildingNumber.text.trim()),
      ]);
    }
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
                  S.of(context).deliveryAddress,
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.w600,
                    color: widget.isDark ? AppColors.white : AppColors.black,
                  ),
                ),
                SizedBox(height: Dimensions.height73),
                Form(
                  key: _formState,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: _city,
                        isDark: widget.isDark,
                        typeField: TypeField.address,
                        validator: (newValue) => _setError(TypeField.address,
                            S.of(context).required, newValue),
                        onSaved: (newValue) {},
                        hint: S.of(context).city,
                      ),
                      SizedBox(height: Dimensions.height10),
                      CustomTextFormField(
                        controller: _street,
                        isDark: widget.isDark,
                        typeField: TypeField.address,
                        validator: (newValue) => _setError(TypeField.address,
                            S.of(context).required, newValue),
                        onSaved: (newValue) {},
                        hint: S.of(context).streetName,
                      ),
                      SizedBox(height: Dimensions.height10),
                      CustomTextFormField(
                        controller: _buildingNumber,
                        isDark: widget.isDark,
                        typeField: TypeField.address,
                        validator: (newValue) => _setError(TypeField.address,
                            S.of(context).required, newValue),
                        onSaved: (newValue) {},
                        hint: S.of(context).buildingNumber,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Dimensions.height100),
                CustomButton(
                  text: S.of(context).next,
                  onclick: () => _saveAddress(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
