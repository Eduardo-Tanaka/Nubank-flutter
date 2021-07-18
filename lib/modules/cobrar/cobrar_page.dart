import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/floating_action_button/floating_action_button_widget.dart';
import 'package:nubank/shared/widgets/input_text_widget/input_text_widget.dart';

class CobrarPage extends StatefulWidget {
  const CobrarPage({Key? key}) : super(key: key);

  @override
  _CobrarPageState createState() => _CobrarPageState();
}

class _CobrarPageState extends State<CobrarPage> {
  final moneyInputTextController = MoneyMaskedTextController(
    leftSymbol: "R\$ ",
    decimalSeparator: ",",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Qual valor você quer receber?",
              style: TextStyles.textBigBold,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 32,
                bottom: 20,
              ),
              child: InputTextWidget(
                autoFocus: true,
                onChanged: (String value) {
                  setState(() {});
                },
                textInputType: TextInputType.number,
                controller: moneyInputTextController,
              ),
            ),
            Text(
              "Não especificar um valor >",
              style: TextStyles.textNuSmall,
            )
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
