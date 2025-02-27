import 'package:chairy_app/core/utils/service_locator.dart';
import 'package:chairy_app/features/categories/domain/entities/product_entity.dart';
import 'package:chairy_app/features/categories/domain/usecases/add_item_to_cart.dart';
import 'package:chairy_app/features/categories/domain/usecases/is_item_exist_to_cart.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/product_details_view_body.dart';
import 'package:chairy_app/features/categories/presentation/viewmodel/product_details/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsView extends StatelessWidget {
  static const String id = "/product_details";
  final ProductEntity product;

  const ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsCubit(
        getIt.get<IsItemExistToCart>(),
        getIt.get<AddItemToCart>(),
      ),
      child: Scaffold(body: ProductDetailsViewBody(product: product)),
    );
  }
}
