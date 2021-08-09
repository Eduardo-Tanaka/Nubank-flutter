import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nubank/modules/emprestimo/emprestimo_cubit.dart';
import 'package:nubank/shared/models/emprestimo.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/button_nu/button_nu_widget.dart';
import 'package:nubank/shared/widgets/tile/tile_resumo_widget.dart';

final DateTime now = DateTime.now();
final DateFormat formatter = DateFormat("dd 'de' MMMM", 'pt_BR');

class EmprestimoSimularInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmprestimoCubit, Emprestimo>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBarWidget(
            icon: Icons.chevron_left,
            showTrailingIcon: true,
          ),
          body: ListView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Simular empréstimo de",
                  style: TextStyles.titleBlackBold,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    "/emprestimo_simular_valor",
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        NumberFormat.currency(locale: "pt_BR", symbol: "R\$")
                            .format(state.valor),
                        style: TextStyles.textNuBigBold,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Icon(
                          Icons.edit_outlined,
                          color: AppColors.primary,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TileResumoWidget(
                title: "Escolha o tipo de empréstimo",
                subtitle: state.tipo!,
                onTap: () {
                  context.read<EmprestimoCubit>().edit(true);
                  Navigator.pushNamed(
                    context,
                    "/emprestimo_simular",
                  ).then(
                      (value) => context.read<EmprestimoCubit>().edit(false));
                },
              ),
              TileResumoWidget(
                title: "Escolha o número de parcelas",
                subtitle: "12x de R\$ 10,40",
                thirdLine: "Juros de 3,25% ao mês",
                onTap: () {},
              ),
              TileResumoWidget(
                title: "Escolha a data da primeira parcela",
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
                            NumberFormat.currency(
                                    locale: "pt_BR", symbol: "R\$")
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
      },
    );
  }
}
