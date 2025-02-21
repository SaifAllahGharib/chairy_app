import 'package:chairy_app/features/splash/presentation/views/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  static const String id = "/";

  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplashViewBody());
  }
}
