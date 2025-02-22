import 'package:chairy_app/features/categories/data/models/category_model.dart';
import 'package:dio/dio.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final Dio dio;

  CategoryRemoteDataSourceImpl(this.dio);

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await dio.get(
      'https://your-api.com/api/category/get',
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Accept-Language': 'en',
          'Authorization': 'Bearer YOUR_ACCESS_TOKEN',
        },
      ),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data['data'];
      return data.map((json) => CategoryModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
