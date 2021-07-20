import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';

class ReceberPage extends StatefulWidget {
  const ReceberPage({Key? key}) : super(key: key);

  @override
  _ReceberPageState createState() => _ReceberPageState();
}

class _ReceberPageState extends State<ReceberPage> {
  double opacity = 1;
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
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "/cobrar",
                        arguments: moneyInputTextController.numberValue,
                      ).then((value) {
                        moneyInputTextController.text = value.toString();
                        opacity = 1;
                        setState(() {});
                      });
                    },
                    onTapDown: (TapDownDetails details) {
                      setState(() {
                        opacity = 0.4;
                      });
                    },
                    onTapCancel: () {
                      setState(() {
                        opacity = 1.0;
                      });
                    },
                    child: Opacity(
                      opacity: opacity,
                      child: Row(
                        children: [
                          Text(
                            moneyInputTextController.text,
                            style: TextStyles.textNuBigBold,
                          ),
                          Icon(
                            Icons.edit_outlined,
                            color: AppColors.background,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.grey,
                  padding: EdgeInsets.all(16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(32),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.comment_outlined,
                      color: AppColors.background,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        "Escrever uma mensagem",
                        style: TextStyles.textNuBold,
                      ),
                    ),
                  ],
                ),
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
              child: TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Criar QR code",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.background,
                  padding: EdgeInsets.all(16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(32),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
