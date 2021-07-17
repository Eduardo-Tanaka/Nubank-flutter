import 'package:flutter/material.dart';

import 'package:nubank/shared/themes/app_text_styles.dart';

class ButtonAjudaWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const ButtonAjudaWidget({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyles.textBlack,
        ),
        style: TextButton.styleFrom(
          backgroundColor: Colors.grey[200],
          primary: Colors.grey[600],
          padding: EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 60,
          ),
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
