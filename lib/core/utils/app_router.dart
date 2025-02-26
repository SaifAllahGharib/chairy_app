import 'package:chairy_app/features/categories/domain/entities/product_entity.dart';
import 'package:chairy_app/features/auth/presentaion/view/auth_view.dart';
import 'package:chairy_app/features/categories/domain/entities/category_entity.dart';
import 'package:chairy_app/features/categories/presentation/view/product_details_view.dart';
import 'package:chairy_app/features/categories/presentation/view/products_category_view.dart';
import 'package:chairy_app/features/main/presentation/view/main_view.dart';
import 'package:chairy_app/features/menu/presentation/view/menu_view.dart';
import 'package:chairy_app/features/search/presentation/view/search_view.dart';
import 'package:chairy_app/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: SplashView.id,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: MainView.id,
        builder: (context, state) => const MainView(),
      ),
      GoRoute(
        path: SearchView.id,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: MenuView.id,
        builder: (context, state) => const MenuView(),
      ),
      GoRoute(
        path: ProductsCategoryView.id,
        builder: (context, state) =>
            ProductsCategoryView(category: state.extra as CategoryEntity),
      ),
      GoRoute(
        path: ProductDetailsView.id,
        builder: (context, state) =>
            ProductDetailsView(product: state.extra as ProductEntity),
      ),
      GoRoute(path: AuthView.id, builder: (context, state) => const AuthView()),
    ],
  );
}
