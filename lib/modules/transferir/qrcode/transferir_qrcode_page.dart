import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/tile/tile_widget.dart';

class TransferirQrcodePage extends StatelessWidget {
  const TransferirQrcodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.grey),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 12,
              bottom: 24,
              left: 20,
              right: 20,
            ),
            child: Text(
              "Pagar um QR Code",
              style: TextStyles.textBigBold,
            ),
          ),
          TileWidget(
            onTap: () {
              Navigator.pushNamed(context, "/qrcode_read");
            },
            title: "Ler QR Code",
            subtitle: "Use a câmera do seu celular",
            iconLeading: Icons.qr_code,
          ),
          TileWidget(
            onTap: () {
              Navigator.pushNamed(context, "/pix_copia_cola");
            },
            title: "Pix Copia e Cola",
            subtitle: "Insira o código que você copiou",
            iconLeading: Icons.content_copy,
          ),
        ],
      ),
    );
  }
}
