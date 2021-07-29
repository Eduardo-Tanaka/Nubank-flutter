import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';

class DetalheWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const DetalheWidget({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  title,
                  style: TextStyles.textBold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  subtitle,
                  style: TextStyles.textGreySmallBold,
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 1,
        )
      ],
    );
  }
}
