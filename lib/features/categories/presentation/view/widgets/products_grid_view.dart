import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/features/categories/domain/entities/product.dart';
import 'package:chairy_app/features/categories/presentation/view/product_details_view.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/products_item_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductsGridView extends StatelessWidget {
  final List<Product> products;

  const ProductsGridView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.height20),
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
            onTap: () => GoRouter.of(context).push(ProductDetailsView.id),
            child: ProductsItemGridView(
              products: products,
              index: index,
            ),
          );
        },
      ),
    );
  }
}
