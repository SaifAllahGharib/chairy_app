import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/core/shared/usecases/is_item_exist.dart';
import 'package:chairy_app/features/categories/domain/usecases/add_item_to_cart.dart';
import 'package:chairy_app/features/categories/presentation/viewmodel/product_details/product_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final AddItemToCart _cashedItemToCart;
  final IsItemExist _isItemExist;

  ProductDetailsCubit(
    this._cashedItemToCart,
    this._isItemExist,
  ) : super(ProductDetailsInitState());

  Future<void> addItemToCart(CartEntity item, String? token) async {
    emit(ProductDetailsLoadingState());
    final response = await _isItemExist.call(token, item.id);

    response.fold(
      (error) => emit(ProductDetailsFailureState(error)),
      (exist) async {
        if (!exist) {
          final response = await _cashedItemToCart.call(item, token);

          response.fold(
            (error) => emit(ProductDetailsFailureState(error)),
            (r) => emit(ProductDetailsAddItemToCartState()),
          );
        } else {
          emit(ProductDetailsItemIsExistToCartState());
        }
      },
    );
  }
}
