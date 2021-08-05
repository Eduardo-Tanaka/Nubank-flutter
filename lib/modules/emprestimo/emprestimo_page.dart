import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nubank/shared/models/ajuda.dart';
import 'package:nubank/shared/models/ajuda_params.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';

class EmprestimoPage extends StatelessWidget {
  const EmprestimoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: Scaffold(
        appBar: AppBarWidget(
          icon: Icons.keyboard_backspace_outlined,
          showTrailingIcon: true,
          onPressedTrailing: () {
            Navigator.pushNamed(
              context,
              "/ajuda_home",
              arguments: AjudaParams(
                title: "Empréstimo Pessoal",
                jsonFile: "emprestimo.json",
              ),
            );
          },
        ),
        body: SingleChildScrollView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "O valor disponível no momento é de R\$ 30.000,00",
                        style: TextStyles.textTitleBold,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Este valor pode mudar diariamente devido à nossa análise de crédito.",
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CupertinoButton(
                        child: Text(
                          "Entenda como funciona >",
                          style: TextStyles.textNu,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            "/ajuda_detalhe",
                            arguments: Ajuda(
                              superTitle: "Empréstimo Pessoal",
                              title:
                                  "O valor disponibilizado para empréstimo e as taxas de juros não são valores fixos. Por que isso acontece?",
                              description:
                                  "Hoje, a nossa análise de crédito faz um estudo do seu perfil em que são considerados os seguintes fatores:\n\nFatores internos: São todas as movimentações que você faz dentro dos produtos do Nubank: Cartão de crédito, Conta do Nubank. Incluindo consumos e pagamentos;\nFatores externos: Informações públicas de crédito e consumo do seu perfil no mercado.\n\nCaso haja alguma mudança nesses fatores, a oferta é recalculada, adaptando o valor e também a taxa de juros para a melhor opção disponível para você naquele momento. É por isso que dizemos que os valores não são fixos e podem mudar de acordo com o estudo feito do seu perfil.",
                            ),
                          );
                        },
                        padding: EdgeInsets.zero,
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      CupertinoButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            "/emprestimo_info",
                          );
                        },
                        padding: EdgeInsets.zero,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.primary,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                          padding: EdgeInsets.all(12),
                          child: Text(
                            "NOVO EMPRÉSTIMO",
                            style: TextStyles.textNuSmallBold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                ),
                SizedBox(
                  height: 28,
                ),
                Text(
                  "Você não possui nenhum empréstimo ativo.",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
