import 'package:chairy_app/core/errors/failure.dart';
import 'package:chairy_app/features/categories/domain/entities/category.dart';

abstract class CategoriesState {}

class CategoriesInitState extends CategoriesState {}

class CategoriesLoadingState extends CategoriesState {}

class CategoriesSuccessState extends CategoriesState {
  final List<Category> categories;

  CategoriesSuccessState(this.categories);
}

class CategoriesFailureState extends CategoriesState {
  final Failure failure;

  CategoriesFailureState(this.failure);
}
