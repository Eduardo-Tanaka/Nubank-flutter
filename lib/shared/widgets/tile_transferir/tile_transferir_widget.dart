import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';

class TileTransferirWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData iconLeading;

  const TileTransferirWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.iconLeading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.white,
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  iconLeading,
                  color: Colors.black,
                ),
                title: Transform.translate(
                  offset: Offset(-10, 0),
                  child: Text(
                    title,
                    style: TextStyles.text,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 14),
                  child: Transform.translate(
                    offset: Offset(-10, 0),
                    child: Text(subtitle),
                  ),
                ),
                trailing: Container(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Icon(
                    Icons.chevron_right,
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
