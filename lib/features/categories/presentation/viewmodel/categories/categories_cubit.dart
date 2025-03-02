import 'package:chairy_app/features/categories/domain/entities/category_entity.dart';
import 'package:chairy_app/features/categories/domain/usecases/get_categories.dart';
import 'package:chairy_app/features/categories/presentation/viewmodel/categories/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategories _getCategories;
  List<CategoryEntity> _categories = [];

  CategoriesCubit(this._getCategories) : super(CategoriesInitState());

  Future<void> fetchCategories() async {
    emit(CategoriesLoadingState());
    final result = await _getCategories.call();

    result.fold(
      (error) => emit(CategoriesFailureState(error)),
      (categories) {
        _categories = categories;
        emit(CategoriesSuccessState(_categories));
      },
    );
  }

  List<CategoryEntity> get categories => _categories;
}
