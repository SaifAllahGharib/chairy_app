import 'package:chairy_app/features/auth/presentaion/view/widgets/auth_view_body.dart';
import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  static const String id = "/auth_view";

  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: AuthViewBody());
  }
}
