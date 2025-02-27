import 'package:chairy_app/core/shared/cubits/product_count/product_count_state.dart';
import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/features/categories/domain/usecases/decrease_item_to_cart.dart';
import 'package:chairy_app/features/categories/domain/usecases/increase_item_to_cart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCountCubit extends Cubit<ProductCountState> {
  final MySharedPreferences _mySharedPreferences;
  final IncreaseItemToCart _increaseItemToCart;
  final DecreaseItemToCart _decreaseItemToCart;

  final Map<int, int> _productCounts = {};

  ProductCountCubit(
    this._increaseItemToCart,
    this._decreaseItemToCart,
    this._mySharedPreferences,
  ) : super(ProductCountInitState());

  Future<void> increment(
    int productId,
    double? productPrice,
    int quantity,
  ) async {
    int currentCount = getCount(productId);

    if (quantity <= 0) {
      emit(ProductOutOfStock());
      return;
    }

    if (currentCount >= quantity) {
      emit(ProductThisQuantityIsOnlyAvailableInit());
      return;
    }

    _updateLocalCount(productId, currentCount + 1);
    emit(ProductCountLoadingState());

    final res = await _increaseItemToCart.call(productId, productPrice);
    res.fold(
      (error) => emit(ProductFailureState(error)),
      (_) => emit(ProductIncrementState()),
    );
  }

  Future<void> decrement(int productId, double? productPrice) async {
    int currentCount = getCount(productId);
    if (currentCount <= 0) return;

    _updateLocalCount(productId, currentCount - 1);
    emit(ProductCountLoadingState());

    final res = await _decreaseItemToCart.call(productId, productPrice);
    res.fold(
      (error) => emit(ProductFailureState(error)),
      (_) => emit(ProductDecrementState()),
    );
  }

  int getCount(int productId) {
    return _productCounts[productId] ??
        _mySharedPreferences.getInt("item$productId") ??
        0;
  }

  void _updateLocalCount(int productId, int newCount) {
    _productCounts[productId] = newCount;
    _mySharedPreferences.storeInt("item$productId", newCount);
  }
}
