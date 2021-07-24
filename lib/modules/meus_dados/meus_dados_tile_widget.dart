import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';

class MeusDadostileWidget extends StatefulWidget {
  final String title;
  final String subtitle;
  final String trailing;

  const MeusDadostileWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.trailing,
  }) : super(key: key);

  @override
  _MeusDadostileWidgetState createState() => _MeusDadostileWidgetState();
}

class _MeusDadostileWidgetState extends State<MeusDadostileWidget> {
  double opacity = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      onTapDown: (TapDownDetails details) {
        setState(() {
          opacity = 0.4;
        });
      },
      onTapCancel: () {
        setState(() {
          opacity = 1.0;
        });
      },
      child: Opacity(
        opacity: opacity,
        child: Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                      ),
                      Visibility(
                        visible: widget.subtitle.isNotEmpty,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            widget.subtitle,
                            style: TextStyles.textGreySmallBold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.trailing,
                        style: TextStyles.textGreySmallBold,
                      ),
                      Icon(
                        Icons.chevron_right_outlined,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
