import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';

class BoletoPage extends StatelessWidget {
  const BoletoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "BOLETO",
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  "R\$ 20,00",
                  style: TextStyles.textNuBigBold,
                ),
                DottedLine(
                  direction: Axis.horizontal,
                  lineLength: 160,
                  lineThickness: 1.0,
                  dashLength: 2.0,
                  dashColor: Colors.black,
                  dashRadius: 0.0,
                  dashGapLength: 2.0,
                  dashGapColor: Colors.transparent,
                  dashGapRadius: 0.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    "Vencimento xx XXX.",
                    style: TextStyles.textSmall,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 64,
                    bottom: 32,
                  ),
                  child: Text(
                    "Utilize o número do código de barras abaixo para realizar o pagamento.",
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  "01234.67890 01234.567890 01234.567890 0 01234567892000",
                  style: TextStyles.textBlack,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: Column(
                    children: [
                      Icon(
                        Icons.copy,
                        color: AppColors.primary,
                      ),
                      Text(
                        "Copiar\ncódigo",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  style: OutlinedButton.styleFrom(
                    primary: Colors.black87,
                    padding: const EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: Column(
                    children: [
                      Icon(
                        Icons.mail_outline,
                        color: AppColors.primary,
                      ),
                      Text(
                        "Enviar por\ne-mail",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  style: OutlinedButton.styleFrom(
                    primary: Colors.black87,
                    padding: const EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
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
