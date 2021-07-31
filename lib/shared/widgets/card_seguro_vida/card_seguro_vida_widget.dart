import 'package:flutter/material.dart';

import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/card_seguro_vida/seguro_vida_checkbox_widget.dart';

class CardSeguroVidaWidget extends StatelessWidget {
  final String title;
  final String badge;
  final bool showBadgeBackground;
  final String subtitle1;
  final String subtitle2;
  final bool? switchValue;
  final Function(bool)? onChanged;
  final bool? showSwitch;
  final List<String>? familiares;
  final SeguroVidaCheckboxWidget? checkbox1;
  final SeguroVidaCheckboxWidget? checkbox2;
  final VoidCallback? onTap;

  const CardSeguroVidaWidget({
    Key? key,
    required this.title,
    required this.badge,
    required this.subtitle1,
    required this.subtitle2,
    this.switchValue = false,
    this.onChanged,
    this.showSwitch = true,
    this.familiares,
    this.checkbox1,
    this.checkbox2,
    required this.onTap,
    this.showBadgeBackground = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyles.textBlack,
                    ),
                    Visibility(
                      visible: badge.isNotEmpty,
                      child: Row(
                        children: [
                          Container(
                            color:
                                showBadgeBackground ? Colors.grey[200] : null,
                            child: Text(
                              badge,
                              style: onTap != null
                                  ? TextStyles.textBlackSmall
                                  : TextStyles.textSmall,
                            ),
                          ),
                          Visibility(
                            visible: showSwitch!,
                            child: Switch(
                              value: switchValue!,
                              onChanged: onChanged,
                              activeColor: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                subtitle1,
                style: TextStyles.textGreySmallBold,
              ),
              Visibility(
                visible: subtitle2.isNotEmpty,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    subtitle2,
                    style: TextStyles.textGreySmallBold,
                  ),
                ),
              ),
              Visibility(
                visible: checkbox1 != null,
                child: checkbox1 ?? Container(),
              ),
              Visibility(
                visible: checkbox2 != null,
                child: checkbox2 ?? Container(),
              ),
              Visibility(
                visible: onTap != null ? true : false,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: GestureDetector(
                    onTap: onTap,
                    child: Row(
                      children: [
                        Text(
                          "Ver detalhes",
                          style: TextStyles.textNuSmallBold,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Icon(
                            Icons.arrow_forward_outlined,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Divider(
            height: 1,
          ),
        ),
      ],
    );
  }
}
