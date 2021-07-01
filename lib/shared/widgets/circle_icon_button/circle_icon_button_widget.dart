import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_colors.dart';

class CircleIconButtonWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const CircleIconButtonWidget({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Icon(
        icon,
        color: Colors.white70,
      ),
      style: ElevatedButton.styleFrom(
        primary: AppColors.circleButtonBackground,
        shape: CircleBorder(),
        padding: EdgeInsets.all(8),
        minimumSize: Size.fromWidth(1),
      ),
    );
  }
}
