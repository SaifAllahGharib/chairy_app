import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/features/categories/domain/entities/category.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<Category>>> getCategories();
}
