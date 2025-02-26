import 'package:chairy_app/core/helper_functions/snack_bar.dart';
import 'package:chairy_app/core/shared/cubits/product_count/product_count_cubit.dart';
import 'package:chairy_app/core/shared/cubits/theme_cubit/theme_cubit.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/core/utils/service_locator.dart';
import 'package:chairy_app/core/widgets/custom_app_bar.dart';
import 'package:chairy_app/core/widgets/custom_button.dart';
import 'package:chairy_app/core/widgets/custom_cached_network_image.dart';
import 'package:chairy_app/core/widgets/loading.dart';
import 'package:chairy_app/features/cart/domain/entities/cart_entity.dart';
import 'package:chairy_app/features/cart/presentation/viewmodel/cart/cart_cubit.dart';
import 'package:chairy_app/features/cart/presentation/viewmodel/cart/cart_state.dart';
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

  int get _countOfProducts =>
      BlocProvider.of<ProductCountCubit>(context).getCount(widget.product.id);

  void _addToCart() {
    if (_countOfProducts > 0) {
      context.read<CartCubit>().addItemToCart(
            CartEntity(
              id: widget.product.id,
              name: widget.product.title,
              price: widget.product.price,
              quantity: widget.product.quantity,
              subTotal: widget.product.price * _countOfProducts,
            ),
            getIt.get<MySharedPreferences>().getUserToken(),
          );
    } else {
      snackBar(
        context: context,
        text: S.of(context).youMustProvideTheNumberOfTheProduct,
      );
    }
  }

  void _handleState(state) {
    if (state is CartAddItemToCartState) {
      snackBar(
        context: context,
        text: S.of(context).theProductWasSuccessfullyAdded,
        color: AppColors.primaryColor,
      );
    } else if (state is CartFailureState) {
      snackBar(
        context: context,
        text: state.failure.message,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) => _handleState(state),
      builder: (context, state) {
        if (state is CartLoadingState) {
          return const Loading();
        }

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
                    CounterAndShareWidget(
                      isDark: _isDark,
                      productId: widget.product.id,
                      productQuantity: widget.product.quantity,
                    ),
                    SizedBox(height: Dimensions.height30),
                    CustomButton(
                      text: S.of(context).addToCart,
                      onclick: () => _addToCart(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
