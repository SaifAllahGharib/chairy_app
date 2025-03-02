import 'package:chairy_app/features/categories/domain/entities/category_entity.dart';
import 'package:chairy_app/features/categories/domain/entities/product_entity.dart';

abstract class SearchState {}

class SearchInitState extends SearchState {}

class SearchGetCategoriesState extends SearchState {
  final List<CategoryEntity> categories;

  SearchGetCategoriesState(this.categories);
}

class SearchGetProductsState extends SearchState {
  final List<ProductEntity> products;

  SearchGetProductsState(this.products);
}
