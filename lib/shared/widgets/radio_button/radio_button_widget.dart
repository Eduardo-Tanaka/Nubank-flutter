import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';

class RadioButtonWidget extends StatelessWidget {
  final groupValue;
  final value;
  final void Function(dynamic value) onChanged;
  final VoidCallback onTap;

  const RadioButtonWidget({
    Key? key,
    this.groupValue,
    this.value,
    required this.onChanged,
    required this.onTap,
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
              title: Text(
                value,
                style: TextStyles.textBold,
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
