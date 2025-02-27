import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/features/categories/domain/usecases/add_item_to_cart.dart';
import 'package:chairy_app/features/categories/domain/usecases/is_item_exist_to_cart.dart';
import 'package:chairy_app/features/categories/presentation/viewmodel/product_details/product_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final IsItemExistToCart _isItemExistToCart;
  final AddItemToCart _addItemToCart;

  ProductDetailsCubit(
    this._isItemExistToCart,
    this._addItemToCart,
  ) : super(ProductDetailsInitState());

  Future<void> addItemToCart(CartEntity cart, String? token) async {
    emit(ProductDetailsLoadingState());

    final product = await _isItemExistToCart.call(cart.id);

    product.fold(
      (error) => emit(ProductDetailsFailureState(error)),
      (r) async {
        if (r) {
          emit(ProductDetailsItemIsExistToCartState());
        } else {
          final result = await _addItemToCart.call(cart, token);

          result.fold(
            (error) => emit(ProductDetailsFailureState(error)),
            (r) => emit(ProductDetailsAddItemToCartState()),
          );
        }
      },
    );
  }
}
