import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nubank/shared/widgets/tile/tile_widget.dart';

class PagarPage extends StatefulWidget {
  const PagarPage({Key? key}) : super(key: key);

  @override
  _PagarPageState createState() => _PagarPageState();
}

class _PagarPageState extends State<PagarPage> {
  var op1 = 1.0;
  var op2 = 1.0;
  var op3 = 1.0;

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
            onTap: () {
              Future.delayed(
                Duration(seconds: 1),
              ).then(
                (value) => {
                  setState(() {
                    op1 = 1.0;
                    Navigator.pushNamed(context, "/pix_copia_cola");
                  })
                },
              );
            },
            onTapDown: (_) {
              setState(() {
                op1 = 0.5;
              });
            },
            onTapCancel: () {
              setState(() {
                op1 = 1.0;
              });
            },
            opacity: op1,
            title: "Pagar com Pix",
            subtitle: "Leia um QR Code ou cole o código",
            iconLeading: Icons.ac_unit,
            topPadding: height / 12,
            bottomPadding: height / 12,
            ripple: false,
          ),
          TileWidget(
            onTap: () {
              Future.delayed(
                Duration(seconds: 1),
              ).then(
                (value) => {
                  setState(() {
                    op2 = 1.0;
                    Navigator.pushNamed(context, "/pix_copia_cola");
                  })
                },
              );
            },
            onTapDown: (_) {
              setState(() {
                op2 = 0.5;
              });
            },
            onTapCancel: () {
              setState(() {
                op2 = 1.0;
              });
            },
            opacity: op2,
            title: "Pagar fatura do cartão",
            subtitle: "Libere o limite do seu Cartão de crédito",
            iconLeading: FontAwesomeIcons.creditCard,
            topPadding: height / 12,
            bottomPadding: height / 12,
            ripple: false,
          ),
          TileWidget(
            onTap: () {
              Future.delayed(
                Duration(seconds: 1),
              ).then(
                (value) => {
                  setState(() {
                    op3 = 1.0;
                    Navigator.pushNamed(context, "/pix_copia_cola");
                  })
                },
              );
            },
            onTapDown: (_) {
              setState(() {
                op3 = 0.5;
              });
            },
            onTapCancel: () {
              setState(() {
                op3 = 1.0;
              });
            },
            opacity: op3,
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
