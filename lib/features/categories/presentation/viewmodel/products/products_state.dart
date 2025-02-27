import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/features/categories/domain/entities/product_entity.dart';

abstract class ProductsCategoryState {}

class ProductsCategoryInitState extends ProductsCategoryState {}

class ProductsCategoryLoadingState extends ProductsCategoryState {}

class ProductsCategorySuccessState extends ProductsCategoryState {
  final List<ProductEntity> products;

  ProductsCategorySuccessState(this.products);
}

class ProductsCategoryFailureState extends ProductsCategoryState {
  final Failure failure;

  ProductsCategoryFailureState(this.failure);
}

class ProductsCategoryIncrementState extends ProductsCategoryState {
  final int count;

  ProductsCategoryIncrementState(this.count);
}

class ProductsCategoryAddItemToCartState extends ProductsCategoryState {}

class ProductCategoryItemIsExistToCartState extends ProductsCategoryState {
  final String msg;

  ProductCategoryItemIsExistToCartState(this.msg);
}
