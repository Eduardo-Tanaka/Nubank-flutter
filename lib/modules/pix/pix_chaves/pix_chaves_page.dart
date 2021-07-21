import 'package:flutter/material.dart';
import 'package:nubank/modules/pix/pix_chaves/pix_chave_modal_widget.dart';
import 'package:nubank/modules/pix/pix_chaves/pix_registrar_chave_modal_widget.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/tile/tile_widget.dart';

class PixChavesPage extends StatelessWidget {
  const PixChavesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        icon: Icons.navigate_before,
        showTrailingIcon: true,
        onPressedTrailing: () {
          Navigator.pushNamed(context, "/ajuda_pix_home");
        },
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 8,
              ),
              child: Text(
                "Minhas chaves",
                style: TextStyles.textBigBold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 4,
              ),
              child: Text(
                "Gerencie suas chaves para receber transferências pelo Pix.",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6),
              child: ListTile(
                title: Text(
                  "Registrar chave",
                  style: TextStyles.textNuBold,
                ),
                trailing: Icon(
                  Icons.add,
                  color: AppColors.background,
                ),
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
                      return PixRegistrarChaveModalWidget();
                    },
                  );
                },
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text("2 de 5 chaves"),
            ),
            TileWidget(
              title: "Chave aleatória",
              subtitle: "5645454-xxxxxxxxx-xxxxxxxxxxxxxx",
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
                    return PixChaveModalWidget(
                      type: "Chave aleatória",
                      value: "5645454-xxxxxxxxx-xxxxxxxxxxxxxx",
                    );
                  },
                );
              },
              iconLeading: Icons.shield_outlined,
              iconTrailing: Icons.more_vert,
              showDivider: false,
            ),
            TileWidget(
              title: "E-mail",
              subtitle: "teste@teste.com",
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
                    return PixChaveModalWidget(
                      type: "E-mail",
                      value: "teste@teste.com",
                    );
                  },
                );
              },
              iconLeading: Icons.mail_outline,
              iconTrailing: Icons.more_vert,
              showDivider: false,
            ),
          ],
        ),
      ),
    );
  }
}
