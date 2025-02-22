import 'package:chairy_app/features/menu/presentation/view/widgets/menu_view_body.dart';
import 'package:flutter/material.dart';

class MenuView extends StatelessWidget {
  static const String id = "/menu_view";

  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: MenuViewBody());
  }
}
