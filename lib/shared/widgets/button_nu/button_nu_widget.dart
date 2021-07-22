import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_colors.dart';

class ButtonNuWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double padding;

  const ButtonNuWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    this.padding = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ],
      ),
      style: TextButton.styleFrom(
        backgroundColor: AppColors.background,
        padding: EdgeInsets.all(padding),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(32),
          ),
        ),
      ),
    );
  }
}
