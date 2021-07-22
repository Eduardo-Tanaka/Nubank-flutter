import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_colors.dart';

import 'package:nubank/shared/themes/app_text_styles.dart';

class HomeCardWidget extends StatelessWidget {
  final bool isVisible;
  final bool isVisibleInfo;
  final IconData icon;
  final String title;
  final String subTitle;
  final String? value;
  final String? info;
  final bool showButton;

  const HomeCardWidget({
    Key? key,
    required this.isVisible,
    required this.isVisibleInfo,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.value,
    this.info,
    this.showButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Icon(icon),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyles.titleBlack,
                    ),
                    Icon(
                      Icons.chevron_right,
                    ),
                  ],
                ),
              ),
              Text(
                subTitle,
                style: TextStyles.textAjuda,
              ),
              Visibility(
                visible: value == null ? false : true,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    color: isVisible ? null : Colors.grey[200],
                    width: MediaQuery.of(context).size.width / 1.4,
                    child: Text(
                      isVisible ? value ?? "" : "",
                      style: TextStyles.titleBlack,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: info == null ? false : true,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    color: isVisibleInfo ? null : Colors.grey[200],
                    width: MediaQuery.of(context).size.width / 1.4,
                    child: Text(
                      isVisibleInfo ? info ?? "" : "",
                      style: TextStyles.textAjuda,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: showButton,
                child: Container(
                  width: 120,
                  padding: const EdgeInsets.only(top: 8),
                  child: Chip(
                    label: Text(
                      "Conhecer",
                      style: TextStyles.textWhiteBold,
                    ),
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.all(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
