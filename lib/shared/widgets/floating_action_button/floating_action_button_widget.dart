import 'package:flutter/material.dart';

import 'package:nubank/shared/themes/app_colors.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final dynamic value;
  final int enableValue;
  final int? enableValueMax;
  final IconData? icon;

  const FloatingActionButtonWidget({
    Key? key,
    required this.onPressed,
    this.value,
    this.enableValue = 0,
    this.enableValueMax,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDisabled = false;
    if (value is String || value == null) {
      isDisabled = value == null || value.toString().isEmpty ? true : false;
    } else if (value is int) {
      isDisabled = value != enableValue ? true : false;
    } else if (value is double) {
      isDisabled = value < enableValue
          ? true
          : (enableValueMax != null
              ? value > enableValueMax
                  ? true
                  : false
              : false);
    } else if (value is bool) {
      isDisabled = !value;
    }
    return FloatingActionButton(
      onPressed: () {
        if (isDisabled) {
          return;
        }
        onPressed();
      },
      child: Icon(
        icon ?? Icons.arrow_forward,
        color: icon != null
            ? Colors.black
            : isDisabled
                ? Colors.grey[400]
                : Colors.white,
        size: 24,
      ),
      backgroundColor: isDisabled ? Colors.grey[200] : AppColors.primary,
    );
  }
}
