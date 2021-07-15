import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';

class TilePixWidget extends StatelessWidget {
  final String title;
  final IconData iconLeading;
  final VoidCallback onTap;
  final showTrailingIcon;

  const TilePixWidget({
    Key? key,
    required this.title,
    required this.iconLeading,
    required this.onTap,
    this.showTrailingIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          leading: Icon(iconLeading),
          title: Transform.translate(
            offset: Offset(-20, 0),
            child: Text(
              title,
              style: TextStyles.textBold,
            ),
          ),
          trailing: Visibility(
            visible: showTrailingIcon,
            child: Icon(Icons.chevron_right),
          ),
          onTap: null,
        ),
      ),
    );
  }
}
