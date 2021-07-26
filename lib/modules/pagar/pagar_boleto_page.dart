import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';

class PagarBoletoPage extends StatelessWidget {
  const PagarBoletoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        icon: Icons.arrow_back,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64),
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: new BoxDecoration(
                      border: Border.all(color: AppColors.primary),
                      shape: BoxShape.circle,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ATÉ",
                          style: TextStyles.textBlackSmall,
                        ),
                        Padding(
                          padding: EdgeInsets.zero,
                          child: Text(
                            "3",
                            style: TextStyle(
                              fontSize: 64,
                              fontWeight: FontWeight.w600,
                              fontFamily: GoogleFonts.roboto().fontFamily,
                            ),
                          ),
                        ),
                        Text(
                          "DIAS ÚTEIS",
                          style: TextStyles.textBlackSmall,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 48, bottom: 32),
                  child: Text.rich(
                    TextSpan(
                      text: "Devido ao tempo de processamento de boletos, ",
                      children: [
                        TextSpan(
                          text:
                              "podemos levar até 3 dias úteis para reconhecer o pagamento e ",
                          style: TextStyles.textBlack,
                        ),
                        TextSpan(
                          text: "liberar seu limite.",
                          style: TextStyles.textMoneyGreen,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  "Em média, este é o tempo que os bancos levam oara nos enviar as informações do seu pagamento.",
                  textAlign: TextAlign.center,
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
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      "/boleto",
                      (route) => route.isFirst,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "GERAR BOLETO",
                      style: TextStyles.textNuSmallBold,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
