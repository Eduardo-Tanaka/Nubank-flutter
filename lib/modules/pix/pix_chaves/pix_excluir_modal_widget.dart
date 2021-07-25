import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/button_ajuda/button_ajuda_widget.dart';
import 'package:nubank/shared/widgets/tile/tile_widget.dart';

class PixExcluirModalWidget extends StatelessWidget {
  final String type;
  final String value;

  const PixExcluirModalWidget({
    Key? key,
    required this.type,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: IconButton(
              iconSize: 40,
              splashRadius: 1,
              padding: const EdgeInsets.only(top: 8, bottom: 0),
              icon: Icon(
                Icons.maximize,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Você quer mesmo excluir essa chave?",
              style: TextStyles.titleBlackBold,
            ),
          ),
          TileWidget(
            backgroundColor: Colors.grey[50],
            title: type,
            subtitle: value,
            onTap: () {},
            iconLeading: Icons.shield_outlined,
            showTrailing: false,
            ripple: false,
            showDivider: false,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonAjudaWidget(
                title: "Não",
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ButtonAjudaWidget(
                title: "Sim, excluir",
                onPressed: () {},
                danger: true,
              )
            ],
          )
        ],
      ),
    );
  }
}
