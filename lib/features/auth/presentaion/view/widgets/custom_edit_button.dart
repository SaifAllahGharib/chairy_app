import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomEditButton extends StatelessWidget {
  final void Function() onClick;

  const CustomEditButton({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            colors: [Color(0xFF0F2764), Color(0xFFED1C24)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds);
        },
        child: Text(
          S.of(context).edit,
          style: TextStyle(
            fontSize: Dimensions.fontSize15,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
