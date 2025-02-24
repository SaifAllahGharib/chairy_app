import 'package:chairy_app/core/utils/service_locator.dart';
import 'package:chairy_app/features/auth/domain/usecases/login.dart';
import 'package:chairy_app/features/auth/domain/usecases/register.dart';
import 'package:chairy_app/features/auth/presentaion/view/widgets/auth_view_body.dart';
import 'package:chairy_app/features/auth/presentaion/viewmodel/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthView extends StatelessWidget {
  static const String id = "/auth_view";

  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(
        getIt.get<Register>(),
        getIt.get<Login>(),
      ),
      child: const Scaffold(body: AuthViewBody()),
    );
  }
}
