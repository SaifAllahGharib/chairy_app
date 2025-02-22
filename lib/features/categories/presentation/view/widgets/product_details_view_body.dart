import 'package:chairy_app/core/utils/app_assets.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/widgets/custom_app_bar.dart';
import 'package:chairy_app/core/widgets/custom_button.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/counter_and_share_widget.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/dir_widget.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/title_price_desc_product_widget.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(darkLogo: true),
        DirWidget(
          firstText: S.of(context).livingRoom,
          secText: "Chair",
        ),
        SizedBox(height: Dimensions.height50),
        Expanded(
          child: Image.asset(
            AppAssets.chair,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: Dimensions.height30),
        Padding(
          padding: EdgeInsets.all(Dimensions.height20),
          child: Column(
            children: [
              const TitlePriceDescProductWidget(),
              SizedBox(height: Dimensions.height20),
              const CounterAndShareWidget(),
              SizedBox(height: Dimensions.height30),
              CustomButton(
                text: S.of(context).addToCart,
                onclick: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
