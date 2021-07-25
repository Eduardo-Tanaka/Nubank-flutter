import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/input_text_widget/input_text_widget.dart';

class PagarValorPage extends StatefulWidget {
  const PagarValorPage({Key? key}) : super(key: key);

  @override
  _PagarValorPageState createState() => _PagarValorPageState();
}

class _PagarValorPageState extends State<PagarValorPage> {
  final moneyInputTextController = MoneyMaskedTextController(
    leftSymbol: "R\$ ",
    decimalSeparator: ",",
    initialValue: 20,
  );

  final double faturaAtual = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Quanto ",
                      style: TextStyles.textTitleBold,
                    ),
                    Text(
                      "você quer pagar?",
                      style: TextStyles.textTitle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                InputTextWidget(
                  autoFocus: true,
                  onChanged: (String value) {
                    setState(() {});
                  },
                  textInputType: TextInputType.number,
                  controller: moneyInputTextController,
                  showDivider: false,
                ),
                Visibility(
                  visible:
                      moneyInputTextController.numberValue > 3 ? true : false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible:
                            moneyInputTextController.numberValue > faturaAtual,
                        child: Text("Fatura atual: R\$ $faturaAtual"),
                      ),
                      Text.rich(
                        TextSpan(
                          text: "A fatura continuará ",
                          children: [
                            TextSpan(
                              text: "aberta",
                              style: TextStyles.textBlack,
                            ),
                            TextSpan(text: ", com fechamento em xx de XXX..."),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible:
                      moneyInputTextController.numberValue > 3 ? false : true,
                  child: Text(
                    "Não é possível realizar pagamentos com valores menores que R\$ 3,00.",
                    style: TextStyles.textDanger,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: Colors.black,
                  ),
                  onPressed:
                      moneyInputTextController.numberValue > 3 ? () {} : null,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "Continuar",
                      style: moneyInputTextController.numberValue > 3
                          ? TextStyles.textNuBold
                          : null,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
