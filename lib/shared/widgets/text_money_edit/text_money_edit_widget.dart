import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';

class TextMoneyEditWidget extends StatefulWidget {
  final String text;
  const TextMoneyEditWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  _TextMoneyEditWidgetState createState() => _TextMoneyEditWidgetState();
}

class _TextMoneyEditWidgetState extends State<TextMoneyEditWidget> {
  double opacity = 1;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {},
      onTapDown: (TapDownDetails details) {
        setState(() {
          opacity = 0.4;
        });
      },
      onTapCancel: () {
        setState(() {
          opacity = 1.0;
        });
      },
      child: Opacity(
        opacity: opacity,
        child: Row(
          children: [
            Text(
              widget.text,
              style: TextStyles.textNuBigBold,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Icon(
                Icons.edit_outlined,
                color: AppColors.background,
              ),
            )
          ],
        ),
      ),
    );
  }
}
