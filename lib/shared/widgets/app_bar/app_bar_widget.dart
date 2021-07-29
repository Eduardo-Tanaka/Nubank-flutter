import 'package:flutter/material.dart';

import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final double? value;
  final IconData? icon;
  final String? title;
  final bool showTrailingIcon;
  final IconData? trailingIcon;
  final VoidCallback? onPressedTrailing;
  final VoidCallback? onPress;
  final Color? backgroundColor;
  final double? linearProgressWidth;

  @override
  final Size preferredSize = Size.fromHeight(kToolbarHeight);

  AppBarWidget({
    Key? key,
    this.value,
    this.icon,
    this.title,
    this.showTrailingIcon = false,
    this.trailingIcon,
    this.onPressedTrailing,
    this.onPress,
    this.backgroundColor,
    this.linearProgressWidth = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.white,
      elevation: 0,
      centerTitle: true,
      title: showTitle(),
      leading: IconButton(
        icon: Icon(
          icon ?? Icons.close,
          color: backgroundColor != null ? Colors.white : Colors.grey,
          size: icon == null ? 32 : 40,
        ),
        onPressed: onPress ?? () => Navigator.of(context).pop(),
      ),
      actions: [
        Visibility(
          visible: showTrailingIcon,
          child: IconButton(
            icon: Icon(
              // TODO para não mostrar o ícone, mas manter o epaço do ícone refatorar melhor depois
              trailingIcon == null
                  ? Icons.help_outline
                  : trailingIcon == Icons.help_outline
                      ? null
                      : trailingIcon,
              color: backgroundColor != null ? Colors.white : Colors.grey,
            ),
            onPressed: onPressedTrailing,
          ),
        ),
      ],
    );
  }

  Widget showTitle() {
    if (title != null) {
      return Container(
        child: Text(
          title!,
          style: TextStyles.textBlack,
        ),
      );
    }

    if (value != null) {
      return Container(
        width: linearProgressWidth,
        child: LinearProgressIndicator(
          color: AppColors.background,
          backgroundColor: Colors.grey[100],
          value: value,
        ),
      );
    }

    return Container();
  }
}
