import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/button_nu/button_nu_widget.dart';

class SeguroVidaInfoPage extends StatelessWidget {
  const SeguroVidaInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        showTrailingIcon: true,
        onPressedTrailing: () {
          Navigator.pushNamed(context, "/ajuda_seguro_vida_home");
        },
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 32, bottom: 60, left: 20, right: 20),
              child: Text(
                "Seguro de vida do Nubank",
                style: TextStyles.textBigBold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                "O que é seguro de vida?",
                style: TextStyles.textBold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                "Ter um seguro de vida do Nubank é uma forma inteligente e simples de garantir a sua proteção, e de quem é importante para você, em momento complicados como morte e acidentes.",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                "Caso alguma coisa aconteça, seus beneficiários recebem 100% do valor total da sua cobertura sem burocracia.",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                "Com preço médio inicial de R\S9 opr mês você pode ter um seguro de vida completo e que cabe no bolso. A cobertura básica garante a proteção financeira de seus beneficiários e também oferece assistência funeral em caso de morte do titular.",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Divider(
                height: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                "Seguro de vida é pra mim?",
                style: TextStyles.textBold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                "Seguro de vida é indicado para diferentes objetivos e momentos de vida. Funciona muito bem tanto para quem quer proteger a família em caso de morte, quanto para quem quer garantir um suporte financeiro em caso de imprevistos, como acidentes, hospitalização e invalidez",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                "Aém disso, é possível contratar uma assitência funeral para cobrir uma assistência funeral para cobrir familiares próximos como filhos, companheiro ou companheira e pais.",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Divider(
                height: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                "Este seguro de vida é caro?",
                style: TextStyles.textBold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                "Não é e nem precisa ser. O seguro de vida do Nubank tem um dos preços mais baixos do mercado, com coberturas excelentes e não tem aumento de preço por idade por 5 anos, apenas ajuste de inflação.",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Divider(
                height: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                "Tem algum tipo de carência?",
                style: TextStyles.textBold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                "Não temos período de carência em casos de acidente. Para mortes com causas naturais (incluindo Covid-19), a carência é de 90 dias.",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Divider(
                height: 1,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              ButtonNuWidget(
                text: "Simular meu seguro",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
