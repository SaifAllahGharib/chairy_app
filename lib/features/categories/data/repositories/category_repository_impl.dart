import 'package:chairy_app/core/errors/errore_handler.dart';
import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/features/categories/data/data_sources/category_local_data_source.dart';
import 'package:chairy_app/features/categories/data/data_sources/category_remote_data_source.dart';
import 'package:chairy_app/features/categories/domain/entities/category_entity.dart';
import 'package:chairy_app/features/categories/domain/repositories/category_repository.dart';
import 'package:dartz/dartz.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource _remoteDataSource;
  final CategoryLocalDataSource _localDataSource;
  final MySharedPreferences _mySharedPreferences;

  CategoryRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._mySharedPreferences,
  );

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      if (!(_mySharedPreferences.getBool("con") ?? true)) {
        return right(_localDataSource.getCachedCategories());
      }

      final categories = await _remoteDataSource.getCategories();

      await _localDataSource.cacheCategories(categories);

      return Right(categories);
    } catch (e) {
      return Left(ErrorHandler.handleError(e));
    }
  }
}
