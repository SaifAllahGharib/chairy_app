import 'package:chairy_app/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: SplashView.id,
        builder: (context, state) => SplashView(),
      ),
    ],
  );
}
