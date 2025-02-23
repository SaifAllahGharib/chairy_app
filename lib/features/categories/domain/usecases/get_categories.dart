import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/features/categories/domain/entities/category.dart';
import 'package:chairy_app/features/categories/domain/repositories/category_repository.dart';
import 'package:dartz/dartz.dart';

class GetCategories {
  final CategoryRepository repository;

  GetCategories(this.repository);

  Future<Either<Failure, List<Category>>> call() async {
    return await repository.getCategories();
  }
}
