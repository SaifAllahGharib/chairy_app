import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/core/shared/entities/cart_entity.dart';

abstract class CartState {}

class CartInitState extends CartState {}

class CartLoadingState extends CartState {}

class CartGetItemsFromCartState extends CartState {
  final List<CartEntity> items;

  CartGetItemsFromCartState(this.items);
}

class CartRemoveItemFromCartState extends CartState {}

class CartFailureState extends CartState {
  final Failure failure;

  CartFailureState(this.failure);
}
