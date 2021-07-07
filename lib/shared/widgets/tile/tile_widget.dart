import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';

class TileWidget extends StatefulWidget {
  final String title;
  final String subtitle;
  final IconData iconLeading;
  final VoidCallback? onTap;
  final double topPadding;
  final double bottomPadding;
  final bool ripple;
  final String route;

  TileWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.iconLeading,
    this.onTap,
    this.topPadding = 20,
    this.bottomPadding = 0,
    this.ripple = true,
    required this.route,
  }) : super(key: key);

  @override
  _TileWidgetState createState() => _TileWidgetState();
}

class _TileWidgetState extends State<TileWidget> {
  var op = 1.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.white,
          child: InkWell(
            splashColor: widget.ripple ? null : Colors.transparent,
            highlightColor: widget.ripple ? null : Colors.transparent,
            onTap: widget.onTap == null
                ? () {
                    Future.delayed(Duration(seconds: 1)).then(
                      (value) => {
                        setState(() {
                          op = 1;
                          Navigator.pushNamed(context, widget.route);
                        }),
                      },
                    );
                  }
                : widget.onTap,
            onTapDown: widget.onTap == null
                ? (_) {
                    setState(() {
                      op = 0.5;
                    });
                  }
                : null,
            onTapCancel: widget.onTap == null
                ? () {
                    setState(() {
                      op = 1.0;
                    });
                  }
                : null,
            child: Opacity(
              opacity: op,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: widget.topPadding,
                  bottom: widget.bottomPadding,
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    widget.iconLeading,
                    color: Colors.black,
                  ),
                  title: Transform.translate(
                    offset: Offset(-10, 0),
                    child: Text(
                      widget.title,
                      style: TextStyles.text,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 14),
                    child: Transform.translate(
                      offset: Offset(-10, 0),
                      child: Text(widget.subtitle),
                    ),
                  ),
                  trailing: Container(
                    width: 20,
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Icon(
                        Icons.chevron_right,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Divider(
          height: 1,
          thickness: 1,
        ),
      ],
    );
  }
}
