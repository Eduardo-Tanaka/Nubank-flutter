import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:nubank/shared/models/emprestimo.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/floating_action_button/floating_action_button_widget.dart';
import 'package:nubank/shared/widgets/input_text_widget/input_text_widget.dart';

class EmprestimoSimularValorPage extends StatefulWidget {
  const EmprestimoSimularValorPage({Key? key}) : super(key: key);

  @override
  _EmprestimoSimularValorPageState createState() =>
      _EmprestimoSimularValorPageState();
}

class _EmprestimoSimularValorPageState
    extends State<EmprestimoSimularValorPage> {
  final moneyInputTextController = MoneyMaskedTextController(
    leftSymbol: "R\$ ",
    decimalSeparator: ",",
  );
  final _form = GlobalKey<FormState>(); //for storing form state.
  bool hasError = true;
  Emprestimo? emprestimo;

  @override
  void didChangeDependencies() {
    emprestimo = ModalRoute.of(context)!.settings.arguments as Emprestimo;

    moneyInputTextController.text = emprestimo!.valor!.toStringAsFixed(2);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Form(
              key: _form,
              child: InputTextWidget(
                autoFocus: true,
                onChanged: (String value) {
                  hasError = _form.currentState!.validate();
                  setState(() {});
                },
                textInputType: TextInputType.number,
                controller: moneyInputTextController,
                validator: (text) {
                  if (moneyInputTextController.numberValue < 30) {
                    return 'O valor mínimo é de R\$ 30,00';
                  } else if (moneyInputTextController.numberValue > 25000) {
                    return 'Selecione um valor até R\$ 25.000,00';
                  }
                  return null;
                },
                hasError: !hasError,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButtonWidget(
        onPressed: () {
          Navigator.pop(
            context,
            moneyInputTextController.numberValue,
          );
        },
        value: moneyInputTextController.numberValue,
        enableValue: 30,
        enableValueMax: 25000,
      ),
    );
  }
}
