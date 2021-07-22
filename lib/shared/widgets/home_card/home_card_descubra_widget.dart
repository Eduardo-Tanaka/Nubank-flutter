import 'package:flutter/material.dart';

import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';

class HomeCardDescubraWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String chipText;
  final bool isNew;

  const HomeCardDescubraWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.chipText,
    this.isNew = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.25,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      child: ElevatedButton(
        onPressed: () {},
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
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: new BoxDecoration(
                            color: AppColors.primary,
                            border: Border.all(color: Colors.black, width: 0.0),
                            borderRadius:
                                new BorderRadius.all(Radius.elliptical(4, 4)),
                          ),
                          child: Text(
                            "Novo",
                            style: TextStyles.titleBottomMenu,
                          ),
                        ),
                      ),
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
            Chip(
              label: Text(
                chipText,
                style: TextStyles.textWhiteBold,
              ),
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.all(10),
            ),
          ],
        ),
      ),
    );
  }
}
