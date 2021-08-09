import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nubank/shared/models/emprestimo.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/button_nu/button_nu_widget.dart';
import 'package:nubank/shared/widgets/floating_action_button/floating_action_button_widget.dart';
import 'package:nubank/shared/widgets/radio_button/radio_button_widget.dart';

import 'emprestimo_cubit.dart';

class EmprestimoSimularPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmprestimoCubit, Emprestimo>(
      builder: (ctx, state) {
        return Scaffold(
          appBar: AppBarWidget(
            icon: Icons.chevron_left,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Escolha para simular",
                  style: TextStyles.textBigBold,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Divider(
                height: 1,
              ),
              RadioButtonWidget(
                onChanged: (value) {
                  ctx.read<EmprestimoCubit>().tipo(value);
                },
                onTap: () {
                  ctx.read<EmprestimoCubit>().tipo('pessoal');
                },
                value: 'pessoal',
                groupValue: state.tipo,
                title: 'Empréstimo pessoal',
                subtitle: "Contratação mais rápida",
              ),
              RadioButtonWidget(
                onChanged: (value) {
                  ctx.read<EmprestimoCubit>().tipo('portabilidade');
                },
                onTap: () {
                  ctx.read<EmprestimoCubit>().tipo('portabilidade');
                },
                groupValue: state.tipo,
                value: 'portabilidade',
                title: 'Empréstimo com portabilidade de salário',
                subtitle:
                    "15% de desconto na taxa de juros.\n\nO pedido de portabilidade de salário é feito durante a contratação do empréstimo e o dinheiro cai na hora.",
                isNew: true,
              )
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
                state.edit
                    ? Padding(
                        padding: const EdgeInsets.all(18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Taxa de ${state.tipo == 'portabilidade' ? '2,76%' : '3,25%'} ao mês",
                                  style: TextStyles.textBold,
                                ),
                                Visibility(
                                  visible: state.tipo == 'portabilidade',
                                  child: Text(
                                    "Desconto de xxxx",
                                    style: TextStyles.textMoneyGreen,
                                  ),
                                ),
                              ],
                            ),
                            FloatingActionButtonWidget(
                              onPressed: () {
                                Navigator.pop(
                                  context,
                                );
                              },
                              value: 1,
                              enableValue: 1,
                            ),
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(20),
                        child: ButtonNuWidget(
                          text: "Simular empréstimo",
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              "/emprestimo_simular_info",
                            );
                          },
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
