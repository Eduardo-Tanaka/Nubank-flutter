import 'package:flutter/material.dart';
import 'package:nubank/modules/pix/pix_chaves/pix_excluir_modal_widget.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/tile_pix/tile_pix_widget.dart';
import 'package:share_plus/share_plus.dart';

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
              style: TextStyles.textGreyBold,
            ),
          ),
          TilePixWidget(
            title: "Compartilhar chave",
            iconLeading: Icons.upload_outlined,
            onTap: () {
              Share.share(value);
            },
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
            onTap: () {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                ),
                builder: (context) {
                  return PixExcluirModalWidget(type: type, value: value);
                },
              );
            },
            showTrailingIcon: false,
            danger: true,
          ),
        ],
      ),
    );
  }
}
