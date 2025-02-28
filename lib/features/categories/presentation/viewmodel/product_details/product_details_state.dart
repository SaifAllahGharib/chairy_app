import 'package:chairy_app/core/errors/failure.dart';

abstract class ProductDetailsState {}

class ProductDetailsInitState extends ProductDetailsState {}

class ProductDetailsLoadingState extends ProductDetailsState {}

class ProductDetailsAddItemToCartState extends ProductDetailsState {}

class ProductDetailsItemIsExistToCartState extends ProductDetailsState {}

class ProductDetailsFailureState extends ProductDetailsState {
  final Failure failure;

  ProductDetailsFailureState(this.failure);
}
