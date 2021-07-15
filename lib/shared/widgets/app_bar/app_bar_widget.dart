import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final double? value;
  final IconData? icon;
  final String? title;
  final bool showTrailingIcon;

  @override
  final Size preferredSize = Size.fromHeight(kToolbarHeight);

  AppBarWidget({
    Key? key,
    this.value,
    this.icon,
    this.title,
    this.showTrailingIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: showTitle(),
      leading: IconButton(
        icon: Icon(
          icon ?? Icons.close,
          color: Colors.grey,
          size: icon == null ? 32 : 40,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        Visibility(
          visible: showTrailingIcon,
          child: IconButton(
            icon: Icon(
              Icons.help_outline,
              color: Colors.grey,
            ),
            onPressed: () {},
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
        width: 100,
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
