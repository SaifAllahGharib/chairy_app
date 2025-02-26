import 'package:chairy_app/core/shared/cubits/product_count/product_count_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCountCubit extends Cubit<ProductCountState> {
  final Map<int, int> _productCounts = {};

  ProductCountCubit() : super(ProductCountInit());

  String? increment(int productId, int quantity, List<String> msg) {
    if (quantity > 0) {
      if (getCount(productId) > quantity) {
        return msg[0];
      } else {
        _productCounts[productId] = (_productCounts[productId] ?? 0) + 1;
        emit(ProductIncrementInit());
      }
    } else if (quantity <= 0) {
      return msg[1];
    }

    return null;
  }

  void decrement(int productId) {
    if (_productCounts[productId] != null && _productCounts[productId]! > 0) {
      _productCounts[productId] = _productCounts[productId]! - 1;
      emit(ProductDecrementInit());
    }
  }

  int getCount(int productId) {
    return _productCounts[productId] ?? 0;
  }
}
