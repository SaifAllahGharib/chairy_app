import 'package:chairy_app/features/categories/domain/usecases/get_categories.dart';
import 'package:chairy_app/features/categories/presentation/viewmodel/categories/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategories _getCategories;

  CategoriesCubit(this._getCategories) : super(CategoriesInitState());

  void fetchCategories() async {
    emit(CategoriesLoadingState());
    final result = await _getCategories.call();

    result.fold(
      (error) => emit(CategoriesFailureState(error)),
      (categories) => emit(CategoriesSuccessState(categories)),
    );
  }
}
