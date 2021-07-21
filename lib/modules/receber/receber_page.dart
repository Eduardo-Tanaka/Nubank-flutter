import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/button_message/button_message_widget.dart';
import 'package:nubank/shared/widgets/button_nu/button_nu_widget.dart';
import 'package:nubank/shared/widgets/text_money_edit/text_money_edit_widget.dart';

class ReceberPage extends StatefulWidget {
  const ReceberPage({Key? key}) : super(key: key);

  @override
  _ReceberPageState createState() => _ReceberPageState();
}

class _ReceberPageState extends State<ReceberPage> {
  final moneyInputTextController = MoneyMaskedTextController(
    leftSymbol: "R\$ ",
    decimalSeparator: ",",
  );

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as double;
    if (moneyInputTextController.numberValue == 0) {
      moneyInputTextController.text = args.toString();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        icon: Icons.navigate_before,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recebendo",
                    style: TextStyles.textBigBold,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 32,
                    ),
                    child: Text(
                      "Quem for te pagar vai ver essas informações quando escanear o QR Code.",
                      style: TextStyles.textGrey,
                    ),
                  ),
                  TextMoneyEditWidget(
                    text: moneyInputTextController.text,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "/cobrar",
                        arguments: moneyInputTextController.numberValue,
                      ).then((value) {
                        print(value);
                        moneyInputTextController.text =
                            value == 0.0 ? 0.0.toString() : value.toString();
                        setState(() {});
                      });
                    },
                  ),
                ],
              ),
            ),
            ButtonMessageWidget(
              text: "Escrever uma mensagem",
              onPressed: () {},
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                primary: Colors.grey,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Chave Pix",
                    style: TextStyles.textBlack,
                  ),
                  Text(
                    "Chave aleatória >",
                    style: TextStyles.textGrey,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Nome",
                    style: TextStyles.textBlack,
                  ),
                  Text(
                    "FirstName LastName",
                    style: TextStyles.textGrey,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "CPF",
                    style: TextStyles.textBlack,
                  ),
                  Text(
                    "***.xxx.xxx-**",
                    style: TextStyles.textGrey,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Instituição",
                    style: TextStyles.textBlack,
                  ),
                  Text(
                    "Nubank",
                    style: TextStyles.textGrey,
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                primary: Colors.grey,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Identificador",
                    style: TextStyles.textBlack,
                  ),
                  Text(
                    ">",
                    style: TextStyles.textGreyBold,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 60,
                left: 20,
                right: 20,
                bottom: 20,
              ),
              child: ButtonNuWidget(
                text: "Criar QR code",
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
