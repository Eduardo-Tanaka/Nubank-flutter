import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nubank/shared/widgets/tile/tile_widget.dart';

class PagarPage extends StatelessWidget {
  const PagarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TileWidget(
            route: "/pix_copia_cola",
            title: "Pagar com Pix",
            subtitle: "Leia um QR Code ou cole o código",
            iconLeading: Icons.ac_unit,
            topPadding: height / 12,
            bottomPadding: height / 12,
            ripple: false,
          ),
          TileWidget(
            route: "/pix_copia_cola",
            title: "Pagar fatura do cartão",
            subtitle: "Libere o limite do seu Cartão de crédito",
            iconLeading: FontAwesomeIcons.creditCard,
            topPadding: height / 12,
            bottomPadding: height / 12,
            ripple: false,
          ),
          TileWidget(
            route: "/pix_copia_cola",
            title: "Pagar um boleto",
            subtitle: "Contas de luz, água, etc",
            iconLeading: FontAwesomeIcons.barcode,
            topPadding: height / 12,
            bottomPadding: height / 12,
            ripple: false,
          ),
        ],
      ),
    );
  }
}
