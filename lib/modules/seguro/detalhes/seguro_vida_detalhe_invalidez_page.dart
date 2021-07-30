import 'package:flutter/material.dart';
import 'package:nubank/shared/models/ajuda_params.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';

import 'detalhe_widget.dart';

class SeguroVidaDetalheInvalidezPage extends StatelessWidget {
  const SeguroVidaDetalheInvalidezPage({Key? key}) : super(key: key);

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
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Invalidez permanente total ou parcial por acidente",
                style: TextStyles.textBigBold,
              ),
            ),
            DetalheWidget(
              title: "O que é",
              subtitle:
                  "é um valor que você recebe caso sofra um acidente e perca alguma capacidade física ou mental, de forma total ou parcial. Esse valor serve como um suporte para que você e sua família consigam ter um pouco mais de respiro em caso de um momento delicado como esse.",
            ),
            DetalheWidget(
              title: "Como funciona",
              subtitle:
                  "Em casos de invalidez total por acidente, você recebe o valor total da sua cobertura por morte.\n\nEm casos de invalidez parcial por acidente, o valor depende do tipo de comprometimento.\n\nPara pedir o acionamento dessa cobertura, você ou alguém próximo nos envia um laudo médico pelo aplicativo e, então, o valor é transferido em até 5 dias úteis.",
            ),
            DetalheWidget(
              title: "Período de carência",
              subtitle:
                  "Esta cobertura não tem carência.                      ",
            ),
          ],
        ),
      ),
    );
  }
}
