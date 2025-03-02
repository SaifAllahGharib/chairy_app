import 'package:chairy_app/core/shared/usecases/search_categories.dart';
import 'package:chairy_app/core/shared/usecases/search_products.dart';
import 'package:chairy_app/core/utils/search_type.dart';
import 'package:chairy_app/core/utils/service_locator.dart';
import 'package:chairy_app/features/search/presentation/view/widgets/search_view_body.dart';
import 'package:chairy_app/features/search/presentation/viewmodel/search/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  static const String id = "/search_view";
  final SearchType? searchType;

  const SearchView({
    super.key,
    required this.searchType,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(
        getIt.get<SearchCategories>(),
        getIt.get<SearchProducts>(),
      ),
      child: Scaffold(body: SearchViewBody(searchType: searchType)),
    );
  }
}
