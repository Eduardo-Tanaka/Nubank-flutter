import 'package:flutter/material.dart';
import 'package:nubank/custom_font_app_icons.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/tile/tile_widget.dart';

class MeusCartoesPage extends StatelessWidget {
  const MeusCartoesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Meus cartões",
              style: TextStyles.textBigBold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Cartão físico",
              style: TextStyles.textGreySmallBold,
            ),
          ),
          TileWidget(
            iconLeading: CustomFontApp.phone,
            title: "nome cartao",
            titleStyle: TextStyles.textBold,
            subtitle: ".... XXXX",
            onTap: () {},
            showDivider: false,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Cartão virtual",
              style: TextStyles.textGreySmallBold,
            ),
          ),
          TileWidget(
            iconLeading: CustomFontApp.phone,
            title: "nome cartao",
            titleStyle: TextStyles.textBold,
            subtitle: ".... XXXX",
            onTap: () {},
            isVirtual: true,
            showDivider: false,
          ),
        ],
      ),
    );
  }
}
