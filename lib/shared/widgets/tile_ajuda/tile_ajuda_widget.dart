import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';

class TileAjudaWidget extends StatelessWidget {
  final String title;
  final String description;

  const TileAjudaWidget({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          title,
          style: TextStyles.textBlack,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Flexible(
            child: Text(
              description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
