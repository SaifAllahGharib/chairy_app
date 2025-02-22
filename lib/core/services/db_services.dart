import 'package:chairy_app/features/categories/data/models/category_model.dart';
import 'package:chairy_app/features/categories/data/models/product_model.dart';

abstract class DBServices {
  Future<List<CategoryModel>> getCategories();

  Future<List<ProductModel>> getProductsByCategoryId(int categoryId);

  Future<ProductModel> getProductDetail(String productId);
}
