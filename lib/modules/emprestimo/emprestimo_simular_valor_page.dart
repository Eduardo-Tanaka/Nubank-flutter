import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:nubank/shared/cubit/bool_cubit.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/floating_action_button/floating_action_button_widget.dart';
import 'package:nubank/shared/widgets/input_text_widget/input_text_widget.dart';

import 'emprestimo_cubit.dart';

class EmprestimoSimularValorPage extends StatelessWidget {
  final moneyInputTextController = MoneyMaskedTextController(
    leftSymbol: "R\$ ",
    decimalSeparator: ",",
  );

  @override
  Widget build(BuildContext context) {
    final _form = GlobalKey<FormState>(); //for storing form state.

    moneyInputTextController.text =
        context.read<EmprestimoCubit>().state.valor!.toStringAsFixed(2);
    return BlocProvider(
      create: (_) => BoolCubit(true),
      child: Scaffold(
        appBar: AppBarWidget(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Quanto você gostaria de pegar emprestado?",
                style: TextStyles.textBigBold,
              ),
              SizedBox(
                height: 40,
              ),
              BlocBuilder<BoolCubit, bool>(
                builder: (ctx, state) {
                  return Form(
                    key: _form,
                    child: InputTextWidget(
                      autoFocus: true,
                      onChanged: (String value) {
                        ctx
                            .read<BoolCubit>()
                            .change(_form.currentState!.validate());
                      },
                      textInputType: TextInputType.number,
                      controller: moneyInputTextController,
                      validator: (text) {
                        if (moneyInputTextController.numberValue < 30) {
                          return 'O valor mínimo é de R\$ 30,00';
                        } else if (moneyInputTextController.numberValue >
                            25000) {
                          return 'Selecione um valor até R\$ 25.000,00';
                        }
                        return null;
                      },
                      hasError: !state,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: BlocBuilder<BoolCubit, bool>(
          builder: (context, state) {
            return FloatingActionButtonWidget(
              onPressed: () {
                context
                    .read<EmprestimoCubit>()
                    .valor(moneyInputTextController.numberValue);
                Navigator.pop(
                  context,
                );
              },
              value: state,
            );
          },
        ),
      ),
    );
  }
}
