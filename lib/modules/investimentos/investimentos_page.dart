import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_images.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/floating_action_button/floating_action_button_widget.dart';

class InvestimentosPage extends StatelessWidget {
  const InvestimentosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        icon: Icons.chevron_left_outlined,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset(
                AppImages.investimento,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Invista sem taxas e burocracia!",
              style: TextStyles.textBigBold,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Estamos convidando alguns clientes do Nubank para sere, os primeiros a fazer parte desta revolução roxa dos investimentos, e você é um deles!",
              style: TextStyles.textGrey,
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "Além de não pagar nada para abrir a conta, você terá taxa zero na corretagem de ações!",
              style: TextStyles.textGrey,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButtonWidget(
        onPressed: () {
          Navigator.pushNamed(
            context,
            "/investimentos_info",
          );
        },
        enableValue: 1,
        value: 1,
      ),
    );
  }
}
