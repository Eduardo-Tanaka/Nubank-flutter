import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nubank/shared/models/ajuda.dart';
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
          onPressedTrailing: () {},
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
                              description: "sdfs",
                            ),
                          );
                        },
                        padding: EdgeInsets.zero,
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      CupertinoButton(
                        onPressed: () {},
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
                        /*style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          primary: Colors.white,
                          side: BorderSide(
                            color: AppColors.primary,
                          ),
                        ),*/
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
