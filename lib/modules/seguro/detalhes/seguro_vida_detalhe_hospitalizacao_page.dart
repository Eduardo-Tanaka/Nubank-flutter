import 'package:flutter/material.dart';
import 'package:nubank/shared/models/ajuda_params.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';

import 'detalhe_widget.dart';

class SeguroVidaDetalheHospitalizacaoPage extends StatelessWidget {
  const SeguroVidaDetalheHospitalizacaoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        showTrailingIcon: true,
        onPressedTrailing: () {
          Navigator.pushNamed(
            context,
            "/ajuda_home",
            arguments: AjudaParams(
              title: "Seguro de vida",
              jsonFile: "seguro_vida.json",
            ),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Hospitalização por acidente",
                style: TextStyles.textBigBold,
              ),
            ),
            DetalheWidget(
              title: "O que é",
              subtitle:
                  "Caso você fique pelo menos 48h no hospital por conta de algum acidente, você recebe R\$ 150,00 por dia para usar como quiser. O pagamento total tem um limite de 90 diárias.",
            ),
            DetalheWidget(
              title: "Como funciona",
              subtitle:
                  "Você nos envia os comprovantes de iternação pelo aplicativo e nós te transferimos o valor referente ao período em até 5 dias úteis.",
            ),
            DetalheWidget(
              title: "Período de carência",
              subtitle:
                  "Esta cobertura não tem carência.                            ",
            ),
          ],
        ),
      ),
    );
  }
}
