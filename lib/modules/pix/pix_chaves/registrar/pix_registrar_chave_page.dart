import 'package:flutter/material.dart';
import 'package:nubank/modules/pix/pix_chaves/enums/ChaveTipoEnum.dart';
import 'package:nubank/modules/pix/pix_chaves/registrar/RegistrarChaveModel.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/tile/tile_widget.dart';

class PixRegistrarChavePage extends StatelessWidget {
  const PixRegistrarChavePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as RegistrarChaveModel;
    String title = "";
    switch (args.type) {
      case ChaveTipoEnum.CPF:
        title =
            "Contatos poderão fazer tranasferências pelo Pix usando apenas seu CPF.";
        break;
      case ChaveTipoEnum.EMAIL:
        break;
      case ChaveTipoEnum.TELEFONE:
        break;
      case ChaveTipoEnum.EVP:
        title =
            "Com a chave aleatória, você gera um QR code para receber sem precisar compartilhar seus dados.";
        break;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        icon: Icons.navigate_before,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Registrar ${args.type.value}",
                  style: TextStyles.textBigBold,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 32),
                  child: Text(
                    title,
                    style: TextStyles.textGrey,
                  ),
                ),
              ],
            ),
          ),
          TileWidget(
            title: args.type.value!,
            subtitle: args.value ?? null,
            onTap: () {},
            showTrailing: false,
            iconLeading: args.icon,
            showDivider: false,
            ripple: false,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 200,
        child: Column(
          children: [
            Divider(
              height: 1,
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                children: [
                  Text(
                    "Quem usa Pix pode saber que você tem uma chave cadastrada por telefone ou e-mail, mas sem ter acesso aos seus dados.",
                    style: TextStyles.textCardGrey,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 4,
                      bottom: 32,
                    ),
                    child: Text(
                      "Ao te pagar, a pessoa verá seu nome completo e alguns dígitos do seu CPF.",
                      style: TextStyles.textCardGrey,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Registrar ${args.type.value}",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.background,
                      padding: EdgeInsets.all(16),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(32),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
