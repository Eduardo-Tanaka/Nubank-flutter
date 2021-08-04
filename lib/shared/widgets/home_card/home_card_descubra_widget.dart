import 'package:flutter/material.dart';

import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/text/text_new_widget.dart';

class HomeCardDescubraWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? chipText;
  final bool isNew;
  final VoidCallback? onPressed;

  const HomeCardDescubraWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    this.chipText,
    this.isNew = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      child: ElevatedButton(
        onPressed: onPressed,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: TextStyles.textBold,
                    ),
                    Visibility(
                      visible: isNew,
                      child: TextNewWidget(),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    subtitle,
                  ),
                ),
              ],
            ),
            Visibility(
              visible: chipText == null ? false : true,
              child: Chip(
                label: Text(
                  chipText ?? "",
                  style: TextStyles.textWhiteBold,
                ),
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.all(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
