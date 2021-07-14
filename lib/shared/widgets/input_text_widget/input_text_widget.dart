import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';

class InputTextWidget extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String value) onChanged;
  final TextInputType textInputType;
  final bool autoFocus;
  final String? hint;
  final bool enabled;

  const InputTextWidget({
    Key? key,
    this.label,
    this.icon,
    this.initialValue,
    this.validator,
    this.controller,
    required this.onChanged,
    this.textInputType = TextInputType.text,
    this.autoFocus = false,
    this.hint,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: Column(
        children: [
          TextFormField(
            enabled: enabled,
            cursorColor: AppColors.background,
            autofocus: autoFocus,
            keyboardType: textInputType,
            textAlign: TextAlign.left,
            controller: controller,
            onChanged: onChanged,
            initialValue: initialValue,
            validator: validator,
            style: TextStyles.textBigBold,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyles.textCardGreyLight,
              contentPadding: EdgeInsets.zero,
              labelText: label,
              border: InputBorder.none,
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
