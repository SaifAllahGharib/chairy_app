import 'package:chairy_app/core/services/api_db-services.dart';
import 'package:chairy_app/features/categories/data/models/category_model.dart';

sealed class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final ApiDBServices _dbServices;

  CategoryRemoteDataSourceImpl(this._dbServices);

  @override
  Future<List<CategoryModel>> getCategories() async {
    return await _dbServices.getCategories();
  }
}
