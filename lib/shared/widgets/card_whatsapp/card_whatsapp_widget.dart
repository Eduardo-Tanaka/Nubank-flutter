import 'package:flutter/material.dart';

import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/circle_icon_button/circle_icon_button_widget.dart';

class CardWhatsappWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const CardWhatsappWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
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
            color: Colors.black,
            padding: 12,
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
