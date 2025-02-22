import 'package:chairy_app/features/categories/domain/entities/product.dart';

abstract class ProductsState {}

class ProductsInitState extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsSuccessState extends ProductsState {
  final List<Product> products;

  ProductsSuccessState(this.products);
}

class ProductsFailureState extends ProductsState {
  final String errorMessage;

  ProductsFailureState(this.errorMessage);
}
