import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';

class TextNewWidget extends StatelessWidget {
  final String? text;

  const TextNewWidget({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: new BoxDecoration(
          color: AppColors.primary,
          border: Border.all(color: Colors.black, width: 0.0),
          borderRadius: new BorderRadius.all(Radius.elliptical(4, 4)),
        ),
        child: Text(
          text ?? "Novo",
          style: TextStyles.titleBottomMenu,
        ),
      ),
    );
  }
}
