import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/button_nu/button_nu_widget.dart';
import 'package:nubank/shared/widgets/tile/tile_resumo_widget.dart';

double emprestimo = 100;
final DateTime now = DateTime.now();
final DateFormat formatter = DateFormat("dd 'de' MMMM", 'pt_BR');

class EmprestimoSimularInfoPage extends StatelessWidget {
  const EmprestimoSimularInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        icon: Icons.chevron_left,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Simular empréstimo de",
              style: TextStyles.textBigBold,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  NumberFormat.currency(locale: "pt_BR", symbol: "R\$")
                      .format(emprestimo),
                  style: TextStyles.textNuBigBold,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Icon(
                    Icons.edit_outlined,
                    color: AppColors.background,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          TileResumoWidget(
            title: "Escolha o tipo de empréstimo",
            subtitle: "Empréstimo pessoal",
            onTap: () {},
          ),
          TileResumoWidget(
            title: "Escolha o número de parcelas",
            subtitle: "12x de R\$ 10,40",
            thirdLine: "Juros de 3,25% ao mês",
            onTap: () {},
          ),
          TileResumoWidget(
            title: "Escolha o tipo de empréstimo",
            subtitle: formatter.format(now.add(Duration(days: 30))),
            onTap: () {},
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 95,
        child: Column(
          children: [
            Divider(
              height: 1,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      Text("Total a pagar"),
                      Text(
                        NumberFormat.currency(locale: "pt_BR", symbol: "R\$")
                            .format(123.43),
                        style: TextStyles.textBold,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ButtonNuWidget(
                    text: "Ver resumo",
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        "/emprestimo_calcular",
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
