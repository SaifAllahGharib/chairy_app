import 'package:chairy_app/features/categories/domain/usecases/get_products_by_category_id.dart';
import 'package:chairy_app/features/categories/presentation/viewmodel/products/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final GetProductsByCategoryId _getProductsByCategoryId;

  ProductsCubit(this._getProductsByCategoryId) : super(ProductsInitState());

  void fetchProducts(int categoryId) async {
    emit(ProductsLoadingState());
    final result = await _getProductsByCategoryId.call(categoryId);

    result.fold(
      (error) => emit(ProductsFailureState(error)),
      (categories) => emit(ProductsSuccessState(categories)),
    );
  }
}
