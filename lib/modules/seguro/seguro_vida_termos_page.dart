import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/button_nu/button_nu_widget.dart';

class SeguroVidaTermosPage extends StatelessWidget {
  const SeguroVidaTermosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Termos e condições",
                style: TextStyles.textBigBold,
              ),
              SizedBox(height: 8),
              Text.rich(
                TextSpan(
                  text:
                      "Para facilitar sua leitura e entendimento, fizemos um resumo dos principais pontos que você vai encontrar nas ",
                  style: TextStyles.textGrey,
                  children: [
                    TextSpan(
                      text: "Condições Gerais",
                      style: TextStyles.textGreyBold,
                    ),
                    TextSpan(
                      text:
                          " do seu seguro de vida. É um resumo para que você tenha uma visão geral e facilite o seu entendimento quando for ler na íntegra.",
                      style: TextStyles.textGrey,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              Text(
                "Aqui você encontrará:",
                style: TextStyles.textBold,
              ),
              SizedBox(height: 8),
              Text(
                "- Glossário",
                style: TextStyles.textGrey,
              ),
              Text(
                "- Condições gerais",
                style: TextStyles.textGrey,
              ),
              Text(
                "- Riscos excluídos",
                style: TextStyles.textGrey,
              ),
              Text(
                "- Assistências",
                style: TextStyles.textGrey,
              ),
              Text(
                "- Morte e funeral",
                style: TextStyles.textGrey,
              ),
              Text(
                "- Forma de pagamento",
                style: TextStyles.textGrey,
              ),
              SizedBox(height: 32),
              Text(
                "Este seguro é por prazo determinado tendo a seguradora a faculdade de não renovar a apólice na data de vencimento, sem devolução dos prêmios pagos nos termos da apólice.",
                style: TextStyles.textBold,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ButtonNuWidget(
            onPressed: () {
              Navigator.pop(context);
            },
            text: "Baixar regras do seguro",
            color: Colors.grey[200],
            textColor: Colors.black,
          ),
        ),
      ),
    );
  }
}
