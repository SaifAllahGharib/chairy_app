import 'package:chairy_app/core/services/db_services.dart';
import 'package:chairy_app/features/categories/data/models/category_model.dart';

sealed class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final DBServices _dbServices;

  CategoryRemoteDataSourceImpl(this._dbServices);

  @override
  Future<List<CategoryModel>> getCategories() async {
    return await _dbServices.getCategories();
  }
}
