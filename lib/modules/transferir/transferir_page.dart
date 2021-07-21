import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/floating_action_button/floating_action_button_widget.dart';
import 'package:nubank/shared/widgets/input_text_widget/input_text_widget.dart';

class TransferirPage extends StatefulWidget {
  TransferirPage({
    Key? key,
  }) : super(key: key);

  @override
  _TransferirPageState createState() => _TransferirPageState();
}

class _TransferirPageState extends State<TransferirPage> {
  final moneyInputTextController = MoneyMaskedTextController(
    leftSymbol: "R\$    ",
    decimalSeparator: ",",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.grey),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.qr_code, color: AppColors.background),
            onPressed: () => Navigator.pushNamed(context, "/transferir_qrcode"),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Qual é o valor da transferência?",
              style: TextStyles.textBigBold,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 12,
                bottom: 32,
              ),
              child: Text.rich(
                TextSpan(
                  text: "Saldo disponível em conta ",
                  style: TextStyles.text,
                  children: [
                    TextSpan(
                      text: "R\$ 2.000,00",
                      style: TextStyles.textBold,
                    ),
                  ],
                ),
              ),
            ),
            InputTextWidget(
              autoFocus: true,
              onChanged: (String value) {
                setState(() {});
              },
              textInputType: TextInputType.number,
              controller: moneyInputTextController,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButtonWidget(
        onPressed: () {
          Navigator.pushNamed(
            context,
            "/transferir_destino",
            arguments: moneyInputTextController.numberValue,
          );
        },
        value: moneyInputTextController.numberValue,
      ),
    );
  }
}
