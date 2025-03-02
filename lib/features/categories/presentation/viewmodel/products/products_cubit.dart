import 'package:chairy_app/features/categories/domain/entities/product_entity.dart';
import 'package:chairy_app/features/categories/domain/usecases/get_products_by_category_id.dart';
import 'package:chairy_app/features/categories/presentation/viewmodel/products/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCategoryCubit extends Cubit<ProductsCategoryState> {
  final GetProductsByCategoryId _getProductsByCategoryId;
  List<ProductEntity> _products = [];

  ProductsCategoryCubit(
    this._getProductsByCategoryId,
  ) : super(ProductsCategoryInitState());

  void fetchProducts(int categoryId) async {
    emit(ProductsCategoryLoadingState());
    final result = await _getProductsByCategoryId.call(categoryId);

    result.fold(
      (error) => emit(ProductsCategoryFailureState(error)),
      (products) {
        _products = products;
        emit(ProductsCategorySuccessState(_products));
      },
    );
  }

  List<ProductEntity> get products => _products;
}
