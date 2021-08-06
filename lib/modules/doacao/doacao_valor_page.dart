import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nubank/shared/models/doacao.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/button_nu/button_nu_rectangle_widget.dart';
import 'package:nubank/shared/widgets/radio_button/radio_button_widget.dart';

import 'cubit/doacao_cubit.dart';

class DoacaoValorPage extends StatelessWidget {
  const DoacaoValorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<double> valores = [
      5,
      10,
      20,
      30,
      50,
      100,
    ];
    return Scaffold(
      body: BlocProvider(
        create: (context) => DoacaoCubit(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 60,
                left: 20,
                right: 20,
              ),
              child: Text(
                "Qual é o valor da doação?",
                style: TextStyles.textTitleBold,
              ),
            ),
            Column(
              children: [
                Divider(
                  height: 1,
                ),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: valores.length,
                  itemBuilder: (context, position) {
                    return BlocBuilder<DoacaoCubit, Doacao>(
                      builder: (context, state) {
                        return RadioButtonWidget(
                          onChanged: (value) {
                            context
                                .read<DoacaoCubit>()
                                .valor(valores[position]);
                          },
                          onTap: () {
                            context
                                .read<DoacaoCubit>()
                                .valor(valores[position]);
                          },
                          groupValue: state.valor,
                          value: valores[position],
                          title: NumberFormat.currency(
                            locale: "pt_BR",
                            symbol: "R\$",
                          ).format(valores[position]),
                          showDivider: false,
                          verticalPadding: 0,
                        );
                      },
                    );
                  },
                ),
                Divider(
                  height: 1,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
              child: BlocBuilder<DoacaoCubit, Doacao>(
                builder: (context, state) {
                  return ButtonNuRectangleWidget(
                    text: "CONTINUAR",
                    isEnabled: state.valor != 0,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        "/doacao_confirmar",
                      );
                    },
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
