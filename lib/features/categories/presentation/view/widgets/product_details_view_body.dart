import 'package:chairy_app/core/helper_functions/snack_bar.dart';
import 'package:chairy_app/core/shared/cubits/counter/counter_cubit.dart';
import 'package:chairy_app/core/shared/cubits/theme_cubit/theme_cubit.dart';
import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/core/utils/service_locator.dart';
import 'package:chairy_app/core/widgets/custom_app_bar.dart';
import 'package:chairy_app/core/widgets/custom_button.dart';
import 'package:chairy_app/core/widgets/custom_cached_network_image.dart';
import 'package:chairy_app/core/widgets/loading.dart';
import 'package:chairy_app/features/categories/domain/entities/product_entity.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/counter_and_share_widget.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/dir_widget.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/title_price_desc_product_widget.dart';
import 'package:chairy_app/features/categories/presentation/viewmodel/product_details/product_details_cubit.dart';
import 'package:chairy_app/features/categories/presentation/viewmodel/product_details/product_details_state.dart';
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

  int get _countOfItem =>
      BlocProvider.of<CounterCubit>(context).getCount(widget.product.id!);

  String? get _token => getIt.get<MySharedPreferences>().getUserToken();

  void _addItemToCart() {
    if (_countOfItem > 0) {
      context.read<ProductDetailsCubit>().addItemToCart(
            CartEntity(
              id: widget.product.id!,
              title: widget.product.title!,
              price: widget.product.price!,
              quantity: _countOfItem,
              subTotal: widget.product.price! * _countOfItem,
            ),
            _token,
          );
    } else {
      snackBar(
        context: context,
        text: S.of(context).pleaseProvideTheNumberOfTheProduct,
      );
    }
  }

  void _handleState(state) async {
    if (state is ProductDetailsAddItemToCartState) {
      snackBar(
        context: context,
        text: S.of(context).theProductWasSuccessfullyAdded,
        color: AppColors.primaryColor,
      );

      await getIt.get<MySharedPreferences>().storeInt(
            "countOfItem${widget.product.id}",
            _countOfItem,
          );
    } else if (state is ProductDetailsItemIsExistToCartState) {
      snackBar(
        context: context,
        text: S.of(context).itemIsAlreadyInTheCart,
      );
    } else if (state is ProductDetailsFailureState) {
      snackBar(
        context: context,
        text: state.failure.message,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
      listener: (context, state) => _handleState(state),
      builder: (context, state) {
        if (state is ProductDetailsLoadingState) {
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
                child:
                    CustomCachedNetworkImage(image: widget.product.imageUrl!),
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
                      product: widget.product,
                    ),
                    SizedBox(height: Dimensions.height30),
                    CustomButton(
                      text: S.of(context).addToCart,
                      onclick: () => _addItemToCart(),
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
