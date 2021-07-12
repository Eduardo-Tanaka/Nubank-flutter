import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';

class TileRecargaWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onPressed;
  final bool? trailing;

  const TileRecargaWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    this.onPressed,
    this.trailing = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          child: ListTile(
            title: Text(title),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                subtitle,
                style: TextStyles.textBold,
              ),
            ),
            trailing: trailing!
                ? Icon(Icons.chevron_right)
                : Visibility(
                    visible: onPressed == null ? false : true,
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => Colors.transparent),
                      ),
                      child: Text(
                        "Editar",
                        style: TextStyles.textNuBold,
                      ),
                      onPressed: onPressed,
                    ),
                  ),
          ),
        ),
        Divider(
          height: 1,
          thickness: 1,
        )
      ],
    );
  }
}
