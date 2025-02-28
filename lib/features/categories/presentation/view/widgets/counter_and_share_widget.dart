import 'package:chairy_app/core/shared/cubits/counter/counter_cubit.dart';
import 'package:chairy_app/core/shared/cubits/counter/counter_state.dart';
import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:chairy_app/core/utils/service_locator.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/core/widgets/custom_category_icon_button.dart';
import 'package:chairy_app/core/widgets/loading.dart';
import 'package:chairy_app/features/categories/domain/entities/product_entity.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/custom_button_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterAndShareWidget extends StatefulWidget {
  final bool isDark;
  final ProductEntity product;

  const CounterAndShareWidget({
    super.key,
    required this.isDark,
    required this.product,
  });

  @override
  State<CounterAndShareWidget> createState() => _CounterAndShareWidgetState();
}

class _CounterAndShareWidgetState extends State<CounterAndShareWidget> {
  String get _token => getIt.get<MySharedPreferences>().getUserToken() ?? "";

  void _increment() {
    context.read<CounterCubit>().increment(
          _token,
          widget.product.id!,
          widget.product.quantity!,
        );
  }

  void _decrement() {
    context.read<CounterCubit>().decrement(_token, widget.product.id!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        if (state is CounterLoadingState) return const Loading();

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomCategoryIconButton(
                      isDark: widget.isDark,
                      color: widget.isDark ? AppColors.white : AppColors.gray,
                      icon: Icons.add,
                      onClick: () => _increment(),
                    ),
                    SizedBox(width: Dimensions.width30),
                    Text(
                      "${context.watch<CounterCubit>().getCount(widget.product.id!)}",
                      style: Styles.textStyle36.copyWith(
                        color: widget.isDark
                            ? AppColors.white
                            : AppColors.midnightBlue,
                      ),
                    ),
                    SizedBox(width: Dimensions.width30),
                    CustomCategoryIconButton(
                      isDark: widget.isDark,
                      color: widget.isDark ? AppColors.white : AppColors.gray,
                      icon: Icons.remove,
                      onClick: () => _decrement(),
                    ),
                  ],
                ),
                const CustomButtonShare(),
              ],
            )
          ],
        );
      },
    );
  }
}
