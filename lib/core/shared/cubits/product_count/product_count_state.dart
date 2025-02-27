import 'package:chairy_app/core/errors/failure.dart';

abstract class ProductCountState {}

class ProductCountInitState extends ProductCountState {}

class ProductCountLoadingState extends ProductCountState {}

class ProductIncrementState extends ProductCountState {}

class ProductDecrementState extends ProductCountState {}

class ProductFailureState extends ProductCountState {
  final Failure failure;

  ProductFailureState(this.failure);
}

class ProductThisQuantityIsOnlyAvailableInit extends ProductCountState {}

class ProductOutOfStock extends ProductCountState {}
