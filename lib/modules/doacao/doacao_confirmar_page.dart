import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/button_nu/button_nu_rectangle_widget.dart';

class DoacaoConfirmarPage extends StatelessWidget {
  const DoacaoConfirmarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              "Confirme sua doação",
              style: TextStyles.textNuTitleBold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            child: Text(
              "O valor escolhido aparecerá na fatura em aberto do seu cartão de crédito. Após confirmar a doação com a sua senha não será possível desfazer a operação.",
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            child: ButtonNuRectangleWidget(
              text: "CONFIRMAR",
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  "/home",
                  (route) => false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
