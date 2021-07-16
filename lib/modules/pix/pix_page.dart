import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nubank/shared/themes/app_images.dart';
import 'package:nubank/shared/widgets/circle_icon_button/circle_icon_button_widget.dart';
import 'package:nubank/shared/widgets/tile_pix/tile_pix_widget.dart';

class PixPage extends StatelessWidget {
  const PixPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.grey),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AppImages.pix_page,
              width: 120,
              height: 120,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                "Minha área PIX",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                "Tudo o que você precisa para pagar, transferir ou cobrar.",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[500],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CircleIconButtonWidget(
                          icon: Icons.qr_code,
                          onPressed: () {
                            Navigator.pushNamed(context, "/transferir_qrcode");
                          },
                          background: Colors.grey[200],
                          color: Colors.black,
                          padding: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text("Pagar"),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        CircleIconButtonWidget(
                          icon: Icons.open_in_browser_outlined,
                          onPressed: () {
                            Navigator.pushNamed(context, "/transferir");
                          },
                          background: Colors.grey[200],
                          color: Colors.black,
                          padding: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text("Transferir"),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        CircleIconButtonWidget(
                          icon: Icons.local_atm_outlined,
                          onPressed: () {},
                          background: Colors.grey[200],
                          color: Colors.black,
                          padding: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text("Cobrar"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 170,
        color: Colors.grey[200],
        child: Column(
          children: [
            TilePixWidget(
              title: "Minhas Chaves",
              iconLeading: FontAwesomeIcons.asterisk,
              onTap: () {
                Navigator.pushNamed(context, "/pix_chaves");
              },
            ),
            TilePixWidget(
              title: "Meu limite Pix",
              iconLeading: Icons.tune,
              onTap: () {},
            ),
            TilePixWidget(
              title: "Me ajuda",
              iconLeading: Icons.help_outline,
              onTap: () {
                Navigator.pushNamed(context, "/ajuda_pix_home");
              },
            ),
          ],
        ),
      ),
    );
  }
}
