import 'package:chairy_app/features/categories/domain/usecases/get_products_by_category_id.dart';
import 'package:chairy_app/features/categories/presentation/viewmodel/products/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCategoryCubit extends Cubit<ProductsCategoryState> {
  final GetProductsByCategoryId _getProductsByCategoryId;

  ProductsCategoryCubit(
    this._getProductsByCategoryId,
  ) : super(ProductsCategoryInitState());

  void fetchProducts(int categoryId) async {
    emit(ProductsCategoryLoadingState());
    final result = await _getProductsByCategoryId.call(categoryId);

    result.fold(
      (error) => emit(ProductsCategoryFailureState(error)),
      (categories) => emit(ProductsCategorySuccessState(categories)),
    );
  }
}
