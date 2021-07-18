import 'package:flutter/material.dart';
import 'package:nubank/modules/pix/pix_chaves/registrar/RegistrarChaveModel.dart';
import 'package:nubank/shared/enums/ChaveTipoEnum.dart';
import 'package:nubank/shared/widgets/tile_pix/tile_pix_widget.dart';

class PixRegistrarChaveModalWidget extends StatelessWidget {
  const PixRegistrarChaveModalWidget({Key? key}) : super(key: key);

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
          IconButton(
            iconSize: 28,
            splashRadius: 12,
            padding: const EdgeInsets.only(top: 0, bottom: 0),
            icon: Icon(
              Icons.close,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            tooltip: "FECHAR",
          ),
          TilePixWidget(
            title: "CPF",
            iconLeading: Icons.article_outlined,
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                "/pix_registrar_chave",
                arguments: RegistrarChaveModel(
                  type: ChaveTipoEnum.CPF,
                  value: "xxx.xxx.xxx-xx",
                  icon: Icons.article_outlined,
                ),
              );
            },
            showTrailingIcon: false,
          ),
          TilePixWidget(
            title: "Celular",
            iconLeading: Icons.phone_android_outlined,
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                "/pix_registrar_chave_input",
                arguments: RegistrarChaveModel(
                  type: ChaveTipoEnum.TELEFONE,
                  value: "(99) 123456789",
                  icon: Icons.shield_outlined,
                ),
              );
            },
            showTrailingIcon: false,
          ),
          TilePixWidget(
            title: "E-mail",
            iconLeading: Icons.mail_outline,
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                "/pix_registrar_chave_input",
                arguments: RegistrarChaveModel(
                  type: ChaveTipoEnum.EMAIL,
                  value: "teste@teste.com",
                  icon: Icons.shield_outlined,
                ),
              );
            },
            showTrailingIcon: false,
          ),
          TilePixWidget(
            title: "Chave aleatória",
            iconLeading: Icons.shield_outlined,
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                "/pix_registrar_chave",
                arguments: RegistrarChaveModel(
                  type: ChaveTipoEnum.EVP,
                  value: null,
                  icon: Icons.shield_outlined,
                ),
              );
            },
            showTrailingIcon: false,
          ),
        ],
      ),
    );
  }
}
