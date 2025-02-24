import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/features/categories/domain/entities/category_entity.dart';
import 'package:chairy_app/features/categories/domain/repositories/category_repository.dart';
import 'package:dartz/dartz.dart';

class GetCategories {
  final CategoryRepository _repository;

  GetCategories(this._repository);

  Future<Either<Failure, List<CategoryEntity>>> call() async {
    return await _repository.getCategories();
  }
}
