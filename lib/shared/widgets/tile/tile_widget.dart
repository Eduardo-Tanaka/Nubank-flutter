import 'package:flutter/material.dart';

import 'package:nubank/shared/themes/app_text_styles.dart';

class TileWidget extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final String? subtitle;
  final IconData? iconLeading;
  final VoidCallback? onTap;
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
  final Color? leadingIconColor;
  final bool isVirtual;

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
    this.leadingIconColor = Colors.black,
    this.isVirtual = false,
    this.titleStyle,
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
                      color: leadingIconColor,
                    ),
                  ),
                  title: Transform.translate(
                    offset: Offset(-10, 0),
                    child: Text(
                      title,
                      style: titleStyle == null ? TextStyles.text : titleStyle,
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
                    width: isVirtual ? 70 : 24,
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: showTrailing
                          ? Row(
                              children: [
                                Visibility(
                                  visible: isVirtual,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    padding: const EdgeInsets.all(2),
                                    child: Text("Virtual"),
                                  ),
                                ),
                                Icon(
                                  iconTrailing ?? Icons.chevron_right,
                                ),
                              ],
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
