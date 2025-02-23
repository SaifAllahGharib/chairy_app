import 'package:chairy_app/core/utils/service_locator.dart';
import 'package:chairy_app/features/categories/domain/usecases/get_categories.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/categories_view_body.dart';
import 'package:chairy_app/features/categories/presentation/viewmodel/categories/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit(getIt.get<GetCategories>()),
      child: const Scaffold(body: CategoriesViewBody()),
    );
  }
}
