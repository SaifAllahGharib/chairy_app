import 'package:chairy_app/core/shared/usecases/search_categories.dart';
import 'package:chairy_app/core/shared/usecases/search_products.dart';
import 'package:chairy_app/core/utils/search_type.dart';
import 'package:chairy_app/features/categories/domain/entities/category_entity.dart';
import 'package:chairy_app/features/categories/domain/entities/product_entity.dart';
import 'package:chairy_app/features/search/presentation/viewmodel/search/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchCategories _searchCategories;
  final SearchProducts _searchProducts;

  List<CategoryEntity> _categories = [];
  List<ProductEntity> _products = [];

  bool _isSearching = false;

  SearchCubit(
    this._searchCategories,
    this._searchProducts,
  ) : super(SearchInitState());

  void search(
    List<CategoryEntity> categories,
    List<ProductEntity> products,
    String query,
    SearchType? searchType,
  ) {
    if (searchType == SearchType.categories) {
      _categories = _searchCategories.call(query, categories);
      if (_categories.isNotEmpty) {
        _isSearching = true;
      }
      if (query.isEmpty) {
        _isSearching = false;
      }
      emit(SearchGetCategoriesState(_categories));
    } else if (searchType == SearchType.products) {
      _products = _searchProducts.call(query, products);
      if (_products.isNotEmpty) {
        _isSearching = true;
      }
      if (query.isEmpty) {
        _isSearching = false;
      }
      emit(SearchGetProductsState(_products));
    }
  }

  bool get isSearching => _isSearching;
}
