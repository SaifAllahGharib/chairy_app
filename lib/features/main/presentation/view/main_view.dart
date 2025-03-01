import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/core/utils/service_locator.dart';
import 'package:chairy_app/features/main/presentation/view/widgets/custom_bottom_nav_bar.dart';
import 'package:chairy_app/features/main/presentation/view/widgets/main_view_body.dart';
import 'package:chairy_app/features/main/presentation/viewmodel/main/main_cubit.dart';
import 'package:chairy_app/features/main/presentation/viewmodel/main/main_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatefulWidget {
  static const String id = "/main_view";

  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  void initState() {
    print("TOKEN: ${getIt.get<MySharedPreferences>().getUserToken()}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          return Scaffold(
            body: MainViewBody(index: context.read<MainCubit>().selectedIndex),
            bottomNavigationBar: CustomBottomNavBar(
              index: context.read<MainCubit>().selectedIndex,
              onIndexChanged: (index) =>
                  context.read<MainCubit>().changeTab(index),
            ),
          );
        },
      ),
    );
  }
}
