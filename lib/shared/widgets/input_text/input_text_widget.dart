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
  final VoidCallback? onTap;
  final bool showDivider;
  final bool hasError;

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
    this.onTap,
    this.showDivider = true,
    this.hasError = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: Column(
        children: [
          Theme(
            data: Theme.of(context).copyWith(
              textSelectionTheme: TextSelectionThemeData(
                cursorColor: Colors.black,
                selectionColor: Colors.black,
                selectionHandleColor: Colors.black,
              ),
              primaryColor: Colors.orange,
              primaryColorDark: Colors.orange,
            ),
            child: TextFormField(
              enabled: enabled,
              cursorColor: AppColors.primary,
              autofocus: autoFocus,
              keyboardType: textInputType,
              textAlign: TextAlign.left,
              controller: controller,
              onChanged: onChanged,
              onTap: onTap,
              initialValue: initialValue,
              validator: validator,
              style: TextStyles.textBigBold,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                suffixIcon: Visibility(
                  visible: hasError,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Icon(
                      Icons.error_outline,
                      color: Colors.red,
                    ),
                  ),
                ),
                hintText: hint,
                hintStyle: TextStyles.textCardGreyLight,
                contentPadding: EdgeInsets.zero,
                labelText: label,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: showDivider ? Colors.grey : Colors.transparent,
                    width: 0.0,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: showDivider ? Colors.grey : Colors.transparent,
                    width: 0.0,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: showDivider ? Colors.grey : Colors.transparent,
                    width: 0.0,
                  ),
                ),
                errorStyle: TextStyles.textSmallBoldDanger,
                focusColor: Colors.yellow,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
