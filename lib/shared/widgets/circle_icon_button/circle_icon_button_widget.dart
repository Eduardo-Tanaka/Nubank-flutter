import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_colors.dart';

class CircleIconButtonWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? background;
  final Color? color;
  final double padding;
  final double iconSize;

  const CircleIconButtonWidget({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.padding,
    this.background,
    this.color,
    this.iconSize = 26,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return onPressed != null
        ? ElevatedButton(
            onPressed: onPressed,
            child: Icon(
              icon,
              color: color == null ? Colors.white : color,
              size: iconSize,
            ),
            style: ElevatedButton.styleFrom(
              primary: background == null
                  ? AppColors.circleButtonBackground
                  : background,
              onPrimary: Colors.black45,
              shape: CircleBorder(),
              padding: EdgeInsets.all(padding),
              elevation: 0,
              minimumSize: Size(8, 8),
            ),
          )
        : Container(
            padding: EdgeInsets.all(padding),
            child: Icon(
              icon,
              color: color == null ? Colors.white : color,
              size: iconSize,
            ),
            decoration: BoxDecoration(
              color: background == null
                  ? AppColors.circleButtonBackground
                  : background,
              border: Border.all(
                color: background == null
                    ? AppColors.circleButtonBackground
                    : background!,
              ),
              shape: BoxShape.circle,
              /*borderRadius: BorderRadius.all(
                Radius.circular(iconSize),
              ),*/
            ),
          );
  }
}
