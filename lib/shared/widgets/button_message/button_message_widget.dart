import 'package:flutter/material.dart';

import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';

class ButtonMessageWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const ButtonMessageWidget({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.grey,
          padding: EdgeInsets.all(16),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(32),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.comment_outlined,
              color: AppColors.background,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                text,
                style: TextStyles.textNuBold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
