import 'package:flutter/material.dart';

import 'package:nubank/shared/themes/app_text_styles.dart';

class ButtonAjudaWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool danger;

  const ButtonAjudaWidget({
    Key? key,
    required this.title,
    required this.onPressed,
    this.danger = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: danger ? TextStyles.textWhiteBold : TextStyles.textBlack,
        ),
        style: TextButton.styleFrom(
          backgroundColor: danger ? Colors.red : Colors.grey[200],
          primary: Colors.grey[600],
          minimumSize: Size(150, 40),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(32),
            ),
          ),
        ),
      ),
    );
  }
}
