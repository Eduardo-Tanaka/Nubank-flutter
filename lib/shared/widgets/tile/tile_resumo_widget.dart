import 'package:flutter/material.dart';

import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';

class TileResumoWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? thirdLine;
  final VoidCallback onTap;

  const TileResumoWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    this.thirdLine,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyles.textNuSmallBold,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      subtitle,
                      style: TextStyles.textBold,
                    ),
                    thirdLine != null
                        ? Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              thirdLine!,
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 14,
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
                Icon(
                  Icons.edit_outlined,
                  color: AppColors.primary,
                ),
              ],
            ),
          ),
        ),
        Divider(
          height: 1,
        ),
      ],
    );
  }
}
