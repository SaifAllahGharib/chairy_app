import 'package:chairy_app/features/categories/presentation/view/widgets/product_details_view_body.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  static const String id = "/product_details";

  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ProductDetailsViewBody());
  }
}
