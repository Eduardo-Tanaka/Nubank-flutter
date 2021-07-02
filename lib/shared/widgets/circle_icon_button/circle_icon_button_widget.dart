import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_colors.dart';

class CircleIconButtonWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color? background;
  final Color? color;
  final double padding;

  const CircleIconButtonWidget({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.padding,
    this.background,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Icon(
        icon,
        color: color == null ? Colors.white70 : color,
      ),
      style: ElevatedButton.styleFrom(
        primary:
            background == null ? AppColors.circleButtonBackground : background,
        shape: CircleBorder(),
        padding: EdgeInsets.all(padding),
        minimumSize: Size(8, 8),
      ),
    );
  }
}
