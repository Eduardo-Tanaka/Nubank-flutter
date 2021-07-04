import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';

class BottomCardMenuWidget extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;

  const BottomCardMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Container(
          height: 120,
          width: 100,
          color: AppColors.circleButtonBackground,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  icon,
                  color: Colors.white,
                  height: 25,
                  width: 25,
                ),
                Text(
                  title,
                  style: TextStyles.titleBottomMenu,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
