import 'package:chairy_app/features/home/presentation/views/home_view.dart';
import 'package:chairy_app/features/splash/presentation/views/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  static const String id = "/";

  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    _goToHome();
    super.initState();
  }

  void _goToHome() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () => GoRouter.of(context).go(HomeView.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SplashViewBody());
  }
}
