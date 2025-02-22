import 'package:chairy_app/features/search/presentation/view/widgets/search_view_body.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  static const String id = "/search_view";

  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SearchViewBody());
  }
}
