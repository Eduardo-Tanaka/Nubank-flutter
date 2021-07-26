import 'package:flutter/material.dart';

import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/circle_icon_button/circle_icon_button_widget.dart';

class CardWhatsappWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final double size;
  final double padding;
  final Color? iconColor;

  const CardWhatsappWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.size = 26,
    this.iconColor,
    this.padding = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleIconButtonWidget(
            icon: icon,
            background: Colors.grey[200],
            color: iconColor ?? Colors.black,
            padding: padding,
            iconSize: size,
            onPressed: null,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              title,
              style: TextStyles.textTitleBold,
            ),
          ),
          Text(
            subtitle,
            style: TextStyles.textSmall,
          ),
        ],
      ),
    );
  }
}
