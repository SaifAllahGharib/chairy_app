import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/viewmodels/theme_cubit/theme_cubit.dart';
import 'package:chairy_app/core/widgets/custom_app_bar.dart';
import 'package:chairy_app/core/widgets/custom_button.dart';
import 'package:chairy_app/core/widgets/custom_cached_network_image.dart';
import 'package:chairy_app/features/categories/domain/entities/product_entity.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/counter_and_share_widget.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/dir_widget.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/title_price_desc_product_widget.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsViewBody extends StatefulWidget {
  final ProductEntity product;

  const ProductDetailsViewBody({super.key, required this.product});

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  bool get _isDark => context.watch<ThemeCubit>().isDark;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppBar(
            darkLogo: true,
            bottom: Dimensions.height50,
          ),
          DirWidget(
            firstText: S.of(context).livingRoom,
            secText: widget.product.title,
          ),
          SizedBox(height: Dimensions.height50),
          SizedBox(
            width: Dimensions.height132 * 1.5,
            height: Dimensions.height132 * 1.5,
            child: CustomCachedNetworkImage(image: widget.product.imageUrl),
          ),
          SizedBox(height: Dimensions.height30),
          Padding(
            padding: EdgeInsets.all(Dimensions.height20),
            child: Column(
              children: [
                TitlePriceDescProductWidget(
                  isDark: _isDark,
                  product: widget.product,
                ),
                SizedBox(height: Dimensions.height20),
                CounterAndShareWidget(isDark: _isDark),
                SizedBox(height: Dimensions.height30),
                CustomButton(
                  text: S.of(context).addToCart,
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
