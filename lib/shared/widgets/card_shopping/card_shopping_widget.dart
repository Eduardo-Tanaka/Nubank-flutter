import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';

class CardShoppingWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  const CardShoppingWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      height: 160,
      width: 160,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                fit: BoxFit.fill,
                image: new NetworkImage(this.image),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            this.title,
            style: TextStyles.textBlack,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Text(
              this.subtitle,
              style: TextStyles.textSmall14,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
