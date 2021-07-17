import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';

class TileAjudaWidget extends StatelessWidget {
  final String title;
  final String description;
  final bool expandSubtitle;
  final VoidCallback onTap;

  const TileAjudaWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.expandSubtitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        onTapCancel: onTap,
        child: Column(
          children: [
            ListTile(
              title: Text(
                title,
                style: expandSubtitle
                    ? TextStyles.textAjudaBold
                    : TextStyles.textBlack,
              ),
              subtitle: Padding(
                padding: expandSubtitle
                    ? const EdgeInsets.only(
                        top: 12,
                        bottom: 48,
                      )
                    : const EdgeInsets.symmetric(vertical: 8),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Text(
                    description,
                    maxLines: expandSubtitle ? null : 1,
                    overflow: expandSubtitle ? null : TextOverflow.ellipsis,
                    style: expandSubtitle ? TextStyles.textAjuda : null,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
