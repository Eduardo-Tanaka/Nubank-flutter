import 'package:flutter/material.dart';

import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';

class SeguroVidaCheckboxWidget extends StatelessWidget {
  final String title;
  final String badge;
  final VoidCallback onTap;
  final bool value;

  const SeguroVidaCheckboxWidget({
    Key? key,
    required this.title,
    required this.badge,
    required this.value,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 20,
                child: Transform.scale(
                  scale: 1.3,
                  child: Checkbox(
                    value: value,
                    onChanged: (value) {
                      onTap();
                    },
                    activeColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(title),
              ),
            ],
          ),
          Container(
            color: Colors.grey[200],
            child: Text(
              badge,
              style: TextStyles.textBlackSmall,
            ),
          ),
        ],
      ),
    );
  }
}
