import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/tile_pix/tile_pix_widget.dart';

class PixChaveModalWidget extends StatelessWidget {
  final String type;
  final String value;

  const PixChaveModalWidget({
    Key? key,
    required this.type,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: IconButton(
              color: Colors.orange,
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
          Center(
            child: Text(
              type,
              style: TextStyles.textBold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: 8,
            ),
            child: Text(
              value,
              style: TextStyles.textGrey,
            ),
          ),
          TilePixWidget(
            title: "Compartilhar chave",
            iconLeading: Icons.upload_outlined,
            onTap: () {},
            showTrailingIcon: false,
          ),
          TilePixWidget(
            title: "Criar QR code",
            iconLeading: Icons.qr_code,
            onTap: () {},
            showTrailingIcon: false,
          ),
          TilePixWidget(
            title: "Excluir chave",
            iconLeading: Icons.delete_outline,
            onTap: () {},
            showTrailingIcon: false,
          ),
        ],
      ),
    );
  }
}
