import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';

class CardMenuWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final String? info1;
  final TextStyle? info1Style;
  final String? info2;
  final TextStyle? info2Style;
  final String? info2Span;
  final TextStyle? info2SpanStyle;
  final String? info2Cont;
  final String? textButton;

  const CardMenuWidget({
    Key? key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.info1,
    this.info1Style,
    this.info2,
    this.info2Style,
    this.info2Span,
    this.info2SpanStyle,
    this.info2Cont,
    this.textButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(icon),
            title: Transform.translate(
              offset: Offset(-20, 0),
              child: Text(
                title,
                style: TextStyles.textCardGray,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: subtitle == null ? false : true,
                  child: Text(
                    subtitle ?? '',
                    textScaleFactor: 0.8,
                    style: TextStyles.textCardGray,
                  ),
                ),
                Visibility(
                  visible: info1 == null ? false : true,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 2, left: 0),
                    child: Text(
                      info1 ?? '',
                      textScaleFactor: 1.5,
                      style: info1Style,
                    ),
                  ),
                ),
                Visibility(
                  visible: info2 == null ? false : true,
                  child: Text.rich(
                    TextSpan(
                      text: info2,
                      style: info2Style,
                      children: [
                        TextSpan(
                          text: info2Span,
                          style: info2SpanStyle,
                        ),
                        TextSpan(text: info2Cont)
                      ],
                    ),
                    textScaleFactor: 0.9,
                  ),
                ),
                Visibility(
                  visible: textButton == null ? false : true,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(textButton ?? ''),
                      style: TextButton.styleFrom(
                        primary: Colors.purple,
                        side: BorderSide(color: Colors.purple, width: 1),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
