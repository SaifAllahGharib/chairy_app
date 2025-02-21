import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/core/utils/styles.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  const TextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          S.of(context).makeModern,
          textAlign: TextAlign.center,
          style: Styles.textStyle36,
        ),
        SizedBox(height: Dimensions.height12),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width63),
          child: Text(
            S.of(context).turnYourRoom,
            textAlign: TextAlign.center,
            style: Styles.textStyle16,
          ),
        ),
      ],
    );
  }
}
