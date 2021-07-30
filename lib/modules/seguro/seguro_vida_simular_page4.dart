import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/button_nu/button_nu_widget.dart';
import 'package:nubank/shared/widgets/card_seguro_vida/card_seguro_vida_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class SeguroVidaSimularPage4 extends StatelessWidget {
  const SeguroVidaSimularPage4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        value: 1,
        linearProgressWidth: null,
        icon: Icons.navigate_before,
        showTrailingIcon: true,
        trailingIcon: Icons.help_outline,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Você vai pagar",
                    style: TextStyles.textBigBold,
                  ),
                  Text(
                    "${NumberFormat.currency(locale: "pt_BR", symbol: "R\$").format(12.54)} / mês",
                    style: TextStyles.textBigBold,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 4,
                      bottom: 20,
                    ),
                    child: Text(
                      "Sem tarifas escondidas",
                      style: TextStyles.textGreySmall,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.local_atm_outlined,
              ),
              title: Text(
                "Forma de pagamento",
                style: TextStyles.textBold,
              ),
              trailing: Text(
                "Conta Nubank",
                style: TextStyles.textGrey,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ListTile(
              leading: Icon(
                Icons.insert_invitation_outlined,
              ),
              title: Text(
                "Data de pagamento",
                style: TextStyles.textBold,
              ),
              trailing: Text(
                "dd/MM/yyyy",
                style: TextStyles.textGrey,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Divider(
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cobertura por morte",
                    style: TextStyles.textTitleBold,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Valor da cobertura",
                        style: TextStyles.textBlack,
                      ),
                      Text(
                        "R\$ 12,54",
                        style: TextStyles.text,
                      ),
                    ],
                  ),
                  Text(
                    "R\$ 75.000,00",
                    style: TextStyles.textGrey,
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
            ),
            CardSeguroVidaWidget(
              title: "Assistência funeral do titular",
              badge: "íncluído",
              showSwitch: false,
              subtitle1:
                  "R\$ 5.000,00 de cobertura para prestação do serviço funeral ou reembolso dos custos.",
              subtitle2:
                  "Há uma carência de 90 dias para morte natural. Para morte acidental, não há carência.",
              onTap: null,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Valor líquido",
                    style: TextStyles.textGreySmall,
                  ),
                  Text(
                    "R\$ 12,49",
                    style: TextStyles.textGreySmall,
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Valor IOF",
                    style: TextStyles.textGreySmall,
                  ),
                  Text(
                    "R\$ 0,05",
                    style: TextStyles.textGreySmall,
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pagamento Mensal",
                    style: TextStyles.textBlack,
                  ),
                  Text(
                    "R\$ 12,54",
                    style: TextStyles.textBlack,
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    "Já está incluso nesse valor a remuneração do Nubank, que é uma taxa de 35% do pagamento mensal líquido, igual a R\$ 4,37",
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text.rich(
                    TextSpan(
                      text:
                          "Coletamos seus dados para lhe oferecer seguro de vida. Para verificar mais detalhes, acesse a ",
                      style: TextStyles.text,
                      children: [
                        TextSpan(
                          text: "pólitica de privacidade >",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: AppColors.primary,
                            fontSize: 18,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              final String _url =
                                  'https://www.chubb.com/br-pt/footer/politica-de-privacidade-da-chubb.html';
                              await canLaunch(_url)
                                  ? await launch(_url)
                                  : throw 'Could not launch $_url';
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text.rich(
                  TextSpan(
                    text:
                        "Este seguro é intermediado pelo Nubank e a seguradora responsável é a Chubb, empresa com operação em mais de 50 países além do Brasil. ",
                    style: TextStyles.text,
                    children: [
                      TextSpan(
                        text: "Entender como isso funciona >",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: AppColors.primary,
                          fontSize: 18,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () async {},
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 120,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              ButtonNuWidget(
                text: "Contratar seguro",
                onPressed: () {},
              ),
              SizedBox(
                height: 12,
              ),
              Text.rich(
                TextSpan(
                  text: "Ao continuar, você aceita os ",
                  children: [
                    TextSpan(
                      text: "Termos e condições",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: AppColors.primary,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
