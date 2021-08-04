import 'package:flutter/material.dart';
import 'package:nubank/shared/models/ajuda_params.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/button_nu/button_nu_widget.dart';
import 'package:nubank/shared/widgets/card_whatsapp/card_whatsapp_widget.dart';
import 'package:nubank/shared/widgets/circle_icon_button/circle_icon_button_widget.dart';

class EmprestimoInfoPage extends StatelessWidget {
  const EmprestimoInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 24, left: 8, right: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleIconButtonWidget(
                    icon: Icons.chevron_left_outlined,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    padding: 4,
                    background: Colors.black,
                    iconSize: 20,
                  ),
                  Tooltip(
                    message: "Ajuda",
                    child: CircleIconButtonWidget(
                      icon: Icons.help_outline,
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          "/ajuda_home",
                          arguments: AjudaParams(
                            title: "Seguro de vida",
                            jsonFile: "seguro_vida.json",
                          ),
                        );
                      },
                      padding: 4,
                      background: Colors.black,
                      iconSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Placeholder(
                  fallbackHeight: 200,
                ),
                SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Text(
                    "Empréstimo do jeito Nubank.",
                    style: TextStyles.textBigBold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  child: Text(
                    "Você no controle do início ao fim.",
                    style: TextStyles.textBold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 32,
                  ),
                  child: Text(
                    "Veja como funciona:",
                    style: TextStyles.textBigBold,
                  ),
                ),
                CardWhatsappWidget(
                  icon: Icons.tune_outlined,
                  size: 28,
                  padding: 20,
                  iconColor: Colors.black,
                  title: "Novo Empréstimo com Portabilidade de Salário",
                  subtitle:
                      "Fazendo a portabilidade de salário direto pelo nosso app, você tem acesso a taxa de juros ainda mais justas e evita gastos com taxas abusivas. É simples, rápido e sem burocracia.",
                ),
                Divider(
                  height: 1,
                ),
                CardWhatsappWidget(
                  icon: Icons.edit_outlined,
                  size: 28,
                  padding: 20,
                  iconColor: Colors.black,
                  title: "Simule fácil",
                  subtitle:
                      "Simule as condições de acordo com o que você precisa e escolha a melhor opção para você.",
                ),
                Divider(
                  height: 1,
                ),
                CardWhatsappWidget(
                  icon: Icons.savings_outlined,
                  size: 28,
                  padding: 20,
                  iconColor: Colors.black,
                  title: "A Conta para você",
                  subtitle:
                      "Depois da contratação, o dinheiro cai na sua Conta do Nubank. Você aproveita os benefícios de rendimento automático maior que a poupança além de TEDs gratuitas e ilimitadas.",
                ),
                Divider(
                  height: 1,
                ),
                CardWhatsappWidget(
                  icon: Icons.ad_units_outlined,
                  size: 28,
                  padding: 20,
                  iconColor: Colors.black,
                  title: "Fique no controle",
                  subtitle:
                      "Você gerencia os pagamentos de forma fácil para nunca sair do controle e antecipa parcelas com desconto sempre que quiser.",
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 95,
        child: Column(
          children: [
            Divider(
              height: 1,
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ButtonNuWidget(
                text: "Calcular empréstimo",
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    "/emprestimo_objetivo",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
