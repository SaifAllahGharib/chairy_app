import 'package:chairy_app/core/errors/errore_handler.dart';
import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/features/categories/data/data_sources/category_remote_data_source.dart';
import 'package:chairy_app/features/categories/domain/entities/category.dart';
import 'package:chairy_app/features/categories/domain/repositories/category_repository.dart';
import 'package:dartz/dartz.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource _remoteDataSource;

  CategoryRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      final categories = await _remoteDataSource.getCategories();
      return Right(categories);
    } catch (e) {
      return Left(ErrorHandler.handleError(e));
    }
  }
}
