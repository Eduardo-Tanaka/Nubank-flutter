import 'package:flutter/material.dart';
import 'package:nubank/shared/models/ajuda_params.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';

import 'detalhe_widget.dart';

class SeguroVidaDetalheFuneralFamiliarPage extends StatelessWidget {
  const SeguroVidaDetalheFuneralFamiliarPage({Key? key}) : super(key: key);

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
                "Assistência funeral de familiares",
                style: TextStyles.textBigBold,
              ),
            ),
            DetalheWidget(
              title: "O que é",
              subtitle:
                  "Pode ser o serviço funeral em si, prestado por um parceiro do Nubank ou da Chubb, ou o reembolso dos custos de R\$ 5.000,00",
            ),
            DetalheWidget(
              title: "Como funciona",
              subtitle:
                  "Prestação do serviço: transporte do corpo dentro ou fora do Brasil, contato com a funerária mais próxima para providenciar todos os itens do funeral, cremação (opcional) e sepultamento.\n\nReembolso: depois de recebermos os comprovantes dos gastos, transferimos o valor, de R\$ 5.000,00, em 5 dias úteis",
            ),
            DetalheWidget(
              title: "Cobertura",
              subtitle:
                  "A assistência funeral pode ser acionada para o titular e também família, caso você tenha escolhido estender essa cobertura para cônjuge, pais e filhos menores de 21 anos. Esse serviço é válido para todos os familiares diretos, mesmo que não estejam na lista de benficiários.",
            ),
            DetalheWidget(
              title: "Período de carência",
              subtitle:
                  "90 dias para mortes com causas naturais e sem período de carência para mortes acidentais.",
            ),
          ],
        ),
      ),
    );
  }
}
