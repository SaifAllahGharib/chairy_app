import 'package:chairy_app/features/categories/domain/entities/category_entity.dart';
import 'package:chairy_app/features/categories/domain/repositories/category_repository.dart';

class SearchCategories {
  final CategoryRepository _categoryRepository;

  SearchCategories(this._categoryRepository);

  List<CategoryEntity> call(String query, List<CategoryEntity> list) {
    return _categoryRepository.searchCategories(query, list);
  }
}
