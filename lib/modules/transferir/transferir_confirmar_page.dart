import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/button_message/button_message_widget.dart';
import 'package:nubank/shared/widgets/button_nu/button_nu_widget.dart';
import 'package:nubank/shared/widgets/text_money_edit/text_money_edit_widget.dart';

class TransferirConfirmarPage extends StatelessWidget {
  const TransferirConfirmarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    print(args);
    final moneyInputTextController = MoneyMaskedTextController(
      leftSymbol: "R\$ ",
      decimalSeparator: ",",
    );

    moneyInputTextController.text = '0.01';
    return Scaffold(
      appBar: AppBarWidget(
        icon: Icons.navigate_before,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Transferindo",
                  style: TextStyles.textBigBold,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                    bottom: 8,
                  ),
                  child: TextMoneyEditWidget(
                    text: moneyInputTextController.text,
                    onTap: () {},
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: "para ",
                    style: TextStyles.text,
                    children: [
                      TextSpan(
                        text: "PIX NAME",
                        style: TextStyles.textBold,
                      ),
                    ],
                  ),
                ),
                getRow(
                  "Quando",
                  "Agora",
                ),
                getRow(
                  "Forma de transferência",
                  "NOME Pix",
                ),
                getRow(
                  "CPF",
                  "NOME ***.xxx.xxx-**",
                ),
                getRow(
                  "Instituição",
                  "NOME INSTITUiÇÃO",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: ButtonMessageWidget(
                    text: "Escrever uma mensagem",
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: ButtonNuWidget(
                text: "Transferir",
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getRow(String text1, String text2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            style: TextStyles.textBold,
          ),
          Text(
            text2,
            style: TextStyles.text,
          )
        ],
      ),
    );
  }
}
