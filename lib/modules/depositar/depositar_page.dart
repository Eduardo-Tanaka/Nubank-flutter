import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/tile/tile_widget.dart';

class DepositarPage extends StatelessWidget {
  const DepositarPage({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: Text(
                "Como você quer depositar na sua conta do Nubank?",
                style: TextStyles.textBigBold,
              ),
            ),
            TileWidget(
              onTap: () {},
              title: "Pix",
              subtitle:
                  "Sem custo e cai na hora, mesmo de madrugada e fim de semana.",
              iconLeading: FontAwesomeIcons.asterisk,
            ),
            TileWidget(
              onTap: () {},
              title: "Boleto",
              subtitle:
                  "Sem custo e pode levar 3 dias úteis para o dinheiro cair.",
              iconLeading: FontAwesomeIcons.barcode,
            ),
            TileWidget(
              onTap: () {},
              title: "TED/DOC",
              subtitle:
                  "Pode ter custo e cai somente em horário comercial de dias úteis.",
              iconLeading: FontAwesomeIcons.barcode,
            ),
            TileWidget(
              onTap: () {},
              title: "Trazer seu salário",
              subtitle: "Receba todo mês direto aqui na sua conta, sem custo.",
              iconLeading: Icons.payments,
            ),
          ],
        ),
      ),
    );
  }
}
