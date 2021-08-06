import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nubank/modules/doacao/cubit/doacao_instituicao_cubit.dart';
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
      body: BlocProvider(
        create: (context) => DoacaoInstituicaoCubit(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 60,
                  ),
                  child: Text(
                    "Para qual instituição você gostaria de doar?",
                    style: TextStyles.textTitleBold,
                  ),
                ),
              ],
            ),
            ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: valores.length,
              itemBuilder: (context, position) {
                return BlocBuilder<DoacaoInstituicaoCubit, String>(
                  builder: (context, state) {
                    return RadioButtonWidget(
                      onChanged: (value) {
                        context
                            .read<DoacaoInstituicaoCubit>()
                            .instituicao(valores[position]);
                      },
                      onTap: () {
                        context
                            .read<DoacaoInstituicaoCubit>()
                            .instituicao(valores[position]);
                      },
                      groupValue: state,
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
              child: BlocBuilder<DoacaoInstituicaoCubit, String>(
                builder: (context, state) {
                  return ButtonNuRectangleWidget(
                    text: "CONTINUAR",
                    isEnabled: state.isNotEmpty,
                    onPressed: () {},
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
