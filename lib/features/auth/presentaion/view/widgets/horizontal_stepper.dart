import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:flutter/material.dart';

class HorizontalStepper extends StatelessWidget {
  final List<String> steps;
  final int currentStep;
  final bool isDark;

  const HorizontalStepper({
    super.key,
    required this.steps,
    required this.currentStep,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      child: Wrap(
        runSpacing: Dimensions.height10 * 0.5,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: List.generate(steps.length, (index) {
          bool isCompleted = index < currentStep;
          return IntrinsicWidth(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width10 * 0.8,
                    vertical: Dimensions.height10 * 0.3,
                  ),
                  decoration: isCompleted
                      ? BoxDecoration(
                          color: AppColors.lightGreen,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                        )
                      : null,
                  child: Row(
                    children: [
                      if (isCompleted)
                        Container(
                          padding: EdgeInsets.all(Dimensions.width10 * 0.2),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.green,
                          ),
                          child: Icon(
                            Icons.check,
                            size: Dimensions.height10,
                            color: AppColors.white,
                          ),
                        )
                      else
                        Container(
                          width: Dimensions.height10 * 1.1,
                          height: Dimensions.height10 * 1.1,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isCompleted
                                  ? AppColors.green
                                  : AppColors.circleColor,
                              width: 2,
                            ),
                            color: Colors.white,
                          ),
                        ),
                      SizedBox(width: Dimensions.width10),
                      Text(
                        steps[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isCompleted
                              ? AppColors.green
                              : isDark
                                  ? AppColors.white
                                  : AppColors.black,
                          fontSize: Dimensions.fontSize10,
                        ),
                      ),
                    ],
                  ),
                ),
                if (index != steps.length - 1)
                  Container(
                    width: Dimensions.width73,
                    height: Dimensions.height10 * 0.2,
                    color: AppColors.gray,
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
