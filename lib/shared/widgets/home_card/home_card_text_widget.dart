import 'package:flutter/material.dart';

import 'package:nubank/shared/themes/app_text_styles.dart';

class HomeCardTextWidget extends StatelessWidget {
  final String text;
  final String textNu;
  final VoidCallback onPressed;

  const HomeCardTextWidget({
    Key? key,
    required this.text,
    required this.textNu,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.3,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text.rich(
              TextSpan(text: text, style: TextStyles.textSmall, children: [
                TextSpan(
                  text: textNu,
                  style: TextStyles.textNuSmall,
                )
              ]),
            ),
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
        ),
      ),
    );
  }
}
