import 'package:flutter/material.dart';
import 'package:nubank/modules/seguro/detalhes/detalhe_widget.dart';
import 'package:nubank/shared/models/ajuda_params.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';

class SeguroVidaDetalheMorteNaturalAcidentalPage extends StatelessWidget {
  const SeguroVidaDetalheMorteNaturalAcidentalPage({Key? key})
      : super(key: key);

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
                "Cobertura de Morte Natural ou Acidental",
                style: TextStyles.textBigBold,
              ),
            ),
            DetalheWidget(
              title: "O que é",
              subtitle:
                  "É o valor total da cobertura, ou seja, um dinheiro que garante a tranquilidade dos seus beneficiários em caso de morte natural ou acidental.",
            ),
            DetalheWidget(
              title: "Como funciona",
              subtitle:
                  "Em caso de morte natural ou acidental, seus benficiários recebem 100% do valor total da cobertura do seu seguro, dividido entre eles, conforme as porcentagens que você definir aqui no aplicativo.",
            ),
            DetalheWidget(
              title: "Período de carência",
              subtitle:
                  "O período de carência é o prazo mínimo necessário para que sua cobertura passe a valer. São 3 meses para morte natural e nenhuma carência para morte acidental.",
            ),
            DetalheWidget(
              title: "Beneficiários",
              subtitle:
                  "Você poderá incluir até 10 pessoas como benficiários do valor total da cobertura do seu seguro, lembrando que não precisam ser as mesmas pessoas da assistência funeral dos familiares e podem ser parentes diretos ou qualquer pessoa que escolher, não sendo necessário vínculo biológico ou de união estável.\n\nCaso não seja incluído nenhum beneficiário, a indenização será paga aos seus herdeiros legais, com baseno Artigo 792 Código Civil Brasileiro.",
            ),
          ],
        ),
      ),
    );
  }
}
