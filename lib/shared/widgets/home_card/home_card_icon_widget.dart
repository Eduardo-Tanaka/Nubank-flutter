import 'package:flutter/material.dart';

import 'package:nubank/shared/themes/app_text_styles.dart';

class HomeCardIconWidget extends StatelessWidget {
  final String text;
  final String? textRight;
  final VoidCallback onPressed;
  final IconData icon;
  final bool isVisible;

  const HomeCardIconWidget({
    Key? key,
    required this.text,
    this.textRight,
    required this.onPressed,
    required this.icon,
    required this.isVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.black,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                text,
                style: TextStyles.textBlack,
              ),
            ),
          ),
          Container(
            color: isVisible
                ? null
                : textRight != null
                    ? Colors.grey[350]
                    : null,
            width: MediaQuery.of(context).size.width / 5,
            child: Text(
              isVisible ? textRight ?? "" : "",
              style: TextStyles.textBlack,
            ),
          ),
        ],
      ),
      style: TextButton.styleFrom(
        backgroundColor: Colors.grey[200],
        padding: EdgeInsets.all(16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        primary: Colors.black87,
        elevation: 0,
      ),
    );
  }
}
