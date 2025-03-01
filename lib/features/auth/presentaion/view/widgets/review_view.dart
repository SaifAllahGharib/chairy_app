import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/widgets/custom_button.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/customer_text_section.dart';
import 'package:chairy_app/features/main/presentation/view/main_view.dart';
import 'package:chairy_app/features/main/presentation/viewmodel/main/main_cubit.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ReviewView extends StatelessWidget {
  final bool isDark;

  const ReviewView({super.key, required this.isDark});

  void _goToHome(BuildContext context) {
    GoRouter.of(context).go(MainView.id);

    context.read<MainCubit>().resetState();

    // context
    //     .read<CartCubit>()
    //     .getItemFromCart(getIt.get<MySharedPreferences>().getUserToken());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomerTextSection(
          isDark: isDark,
          text: S.of(context).thankYouForYourPurchase,
          subText: S.of(context).weAreDoingALittleHappyDanceOverHere,
        ),
        SizedBox(height: Dimensions.height30),
        Expanded(
          child: Image.asset(AppAssets.palon),
        ),
        SizedBox(height: Dimensions.height30),
        Padding(
          padding: EdgeInsets.all(Dimensions.height20),
          child: CustomButton(
            text: S.of(context).goToHome,
            onclick: () => _goToHome(context),
          ),
        ),
      ],
    );
  }
}
