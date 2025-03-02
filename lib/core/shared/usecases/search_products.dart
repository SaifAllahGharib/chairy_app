import 'package:chairy_app/features/categories/domain/entities/product_entity.dart';
import 'package:chairy_app/features/categories/domain/repositories/products_category_repository.dart';

class SearchProducts {
  final ProductsCategoryRepository _productsCategoryRepository;

  SearchProducts(this._productsCategoryRepository);

  List<ProductEntity> call(String query, List<ProductEntity> list) {
    return _productsCategoryRepository.searchCategories(query, list);
  }
}
