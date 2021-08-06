import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nubank/modules/doacao/cubit/doacao_cubit.dart';
import 'package:nubank/shared/models/doacao.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/button_nu/button_nu_rectangle_widget.dart';
import 'package:nubank/shared/widgets/radio_button/radio_button_widget.dart';

class DoacaoInstituicaoPage extends StatelessWidget {
  const DoacaoInstituicaoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> valores = [
      "Ação da Cidadania",
      "Cruz Vermelha",
      "Hospital das Clínicas",
      "Central Única das Favelas",
    ];

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 60,
              left: 20,
              right: 20,
            ),
            child: Text(
              "Para qual instituição você gostaria de doar?",
              style: TextStyles.textTitleBold,
            ),
          ),
          ListView.builder(
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
                          .instituicao(valores[position]);
                    },
                    onTap: () {
                      context
                          .read<DoacaoCubit>()
                          .instituicao(valores[position]);
                    },
                    groupValue: state.instituicao,
                    value: valores[position],
                    showDivider: false,
                    verticalPadding: 0,
                  );
                },
              );
            },
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
                  isEnabled: state.instituicao.isNotEmpty,
                  onPressed: () {
                    if (state.instituicao.isNotEmpty) {
                      Navigator.pushNamed(
                        context,
                        "/doacao_valor",
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
