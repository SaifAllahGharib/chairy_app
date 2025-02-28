import 'package:chairy_app/core/shared/entities/cart_entity.dart';
import 'package:chairy_app/core/utils/hive_service.dart';
import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/core/utils/service_locator.dart';
import 'package:chairy_app/features/auth/domain/usecases/create_order.dart';
import 'package:chairy_app/features/auth/domain/usecases/login.dart';
import 'package:chairy_app/features/auth/domain/usecases/register.dart';
import 'package:chairy_app/features/auth/domain/usecases/sync_cart_with_server.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/auth_view_body.dart';
import 'package:chairy_app/features/auth/presentaion/viewmodel/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthView extends StatelessWidget {
  static const String id = "/auth_view";
  final List<CartEntity> cart;

  const AuthView({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(
        getIt.get<Register>(),
        getIt.get<Login>(),
        getIt.get<SyncCartWithServer>(),
        getIt.get<CreateOrder>(),
        getIt.get<HiveService>(),
        getIt.get<MySharedPreferences>(),
      ),
      child: Scaffold(body: AuthViewBody(cart: cart)),
    );
  }
}
