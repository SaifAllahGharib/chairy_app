import 'package:chairy_app/core/helper_functions/snack_bar.dart';
import 'package:chairy_app/core/shared/cubits/counter/counter_cubit.dart';
import 'package:chairy_app/core/shared/cubits/counter/counter_state.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/features/categories/domain/entities/product_entity.dart';
import 'package:chairy_app/features/categories/presentation/view/product_details_view.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/products_item_grid_view.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductsGridView extends StatelessWidget {
  final List<ProductEntity> products;
  final bool isDark;

  const ProductsGridView({
    super.key,
    required this.products,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterState>(
      listener: (context, state) {
        if (state is CounterProductOutOfStockState) {
          snackBar(context: context, text: S.of(context).outOfStock);
        } else if (state is CounterThisCountIsOnlyAvailableState) {
          snackBar(
            context: context,
            text: S.of(context).thisQuantityIsOnlyAvailable,
          );
        }
      },
      builder: (context, state) {
        return SliverPadding(
          padding: EdgeInsets.only(
            left: Dimensions.height20,
            right: Dimensions.height20,
            bottom: Dimensions.height44,
          ),
          sliver: SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: Dimensions.height20,
              mainAxisSpacing: Dimensions.height30,
              childAspectRatio: Dimensions.height10 * 0.045,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(
                    ProductDetailsView.id,
                    extra: products[index],
                  );
                },
                child: ProductsItemGridView(
                  product: products[index],
                  isDark: isDark,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
