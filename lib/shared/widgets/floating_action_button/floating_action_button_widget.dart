import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_colors.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final dynamic value;
  final int enableValue;

  const FloatingActionButtonWidget({
    Key? key,
    required this.onPressed,
    this.value,
    this.enableValue = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDisabled = false;
    if (value is String || value == null) {
      isDisabled = value == null ? true : false;
    } else if (value is int) {
      isDisabled = value != enableValue ? true : false;
    } else if (value is double) {
      isDisabled = value == enableValue ? true : false;
    }
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(
        Icons.arrow_forward,
        color: isDisabled ? Colors.grey[400] : Colors.white,
        size: 24,
      ),
      backgroundColor: isDisabled ? Colors.grey[200] : AppColors.background,
    );
  }
}
