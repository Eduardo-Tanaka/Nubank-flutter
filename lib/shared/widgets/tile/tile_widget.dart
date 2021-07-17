import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';

class TileWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? iconLeading;
  final VoidCallback onTap;
  final double topPadding;
  final double bottomPadding;
  final bool ripple;
  final GestureTapDownCallback? onTapDown;
  final VoidCallback? onTapCancel;
  final double? opacity;
  final IconData? iconTrailing;
  final bool showDivider;
  final bool showTrailing;
  final Color? backgroundColor;

  const TileWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    this.iconLeading,
    required this.onTap,
    this.topPadding = 20,
    this.bottomPadding = 0,
    this.ripple = true,
    this.onTapDown,
    this.onTapCancel,
    this.opacity = 1,
    this.iconTrailing,
    this.showDivider = true,
    this.showTrailing = true,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: backgroundColor ?? Colors.white,
          child: Opacity(
            opacity: opacity!,
            child: InkWell(
              splashColor: ripple ? null : Colors.transparent,
              highlightColor: ripple ? null : Colors.transparent,
              onTap: onTap,
              onTapDown: onTapDown,
              onTapCancel: onTapCancel,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: topPadding,
                  bottom: bottomPadding,
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Visibility(
                    visible: iconLeading == null ? false : true,
                    child: Icon(
                      iconLeading,
                      color: Colors.black,
                    ),
                  ),
                  title: Transform.translate(
                    offset: Offset(-10, 0),
                    child: Text(
                      title,
                      style: TextStyles.text,
                    ),
                  ),
                  subtitle: subtitle != null
                      ? Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 14),
                          child: Transform.translate(
                            offset: Offset(-10, 0),
                            child: Text(subtitle!),
                          ),
                        )
                      : null,
                  trailing: Container(
                    width: 20,
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: showTrailing
                          ? Icon(
                              iconTrailing ?? Icons.chevron_right,
                            )
                          : Container(),
                    ),
                  ),
                ),
              ),
            ),
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
    );
  }
}
