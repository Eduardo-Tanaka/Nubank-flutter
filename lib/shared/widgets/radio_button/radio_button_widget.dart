import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/text/text_new_widget.dart';

class RadioButtonWidget extends StatelessWidget {
  final groupValue;
  final value;
  final void Function(dynamic value) onChanged;
  final VoidCallback onTap;
  final String? trailingText;
  final bool showDivider;
  final String? title;
  final String? subtitle;
  final bool isNew;

  const RadioButtonWidget({
    Key? key,
    this.groupValue,
    this.value,
    required this.onChanged,
    required this.onTap,
    this.trailingText,
    this.showDivider = true,
    this.title,
    this.subtitle,
    this.isNew = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: ListTile(
              leading: Transform.scale(
                scale: 1.4,
                child: Radio(
                  activeColor: AppColors.background,
                  value: value,
                  groupValue: groupValue,
                  onChanged: onChanged,
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      title != null ? title! : value,
                      style: TextStyles.textBold,
                      maxLines: 2,
                    ),
                  ),
                  Visibility(
                    visible: trailingText == null ? false : true,
                    child: Text(
                      trailingText ?? "",
                      style: TextStyles.textGreyBold,
                    ),
                  ),
                  Visibility(
                    visible: isNew,
                    child: TextNewWidget(),
                  )
                ],
              ),
              subtitle: subtitle != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        subtitle!,
                      ),
                    )
                  : null,
              /*trailing: Visibility(
                visible: trailingText == null ? false : true,
                child: Text(
                  trailingText ?? "",
                  style: TextStyles.textGreyBold,
                ),
              ),*/
            ),
          ),
          Visibility(
            visible: showDivider,
            child: Divider(
              height: 1,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
