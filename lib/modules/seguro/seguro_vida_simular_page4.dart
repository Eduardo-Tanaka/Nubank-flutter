import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nubank/shared/enums/forma_pagamento_enum.dart';
import 'package:nubank/shared/enums/seguro_vida_enum.dart';
import 'package:nubank/shared/models/seguro_vida.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/button_nu/button_nu_widget.dart';
import 'package:nubank/shared/widgets/card_seguro_vida/card_seguro_vida_widget.dart';
import 'package:url_launcher/url_launcher.dart';

final DateTime now = DateTime.now();
final DateFormat formatter = DateFormat('dd/MM/yyyy');
final String hoje = formatter.format(now);
double? funeralFamiliar;

class SeguroVidaSimularPage4 extends StatelessWidget {
  const SeguroVidaSimularPage4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _seguroVida =
        ModalRoute.of(context)!.settings.arguments as SeguroVida;

    if (_seguroVida.seguros.contains(SeguroVidaEnum.FUNERAL_FAMILIAR_PAIS) &&
        _seguroVida.seguros
            .contains(SeguroVidaEnum.FUNERAL_FAMILIAR_CONJUGE_FILHOS)) {
      _seguroVida.seguros
          .remove(SeguroVidaEnum.FUNERAL_FAMILIAR_CONJUGE_FILHOS);
      funeralFamiliar = SeguroVidaEnum.FUNERAL_FAMILIAR_CONJUGE_FILHOS.value! +
          SeguroVidaEnum.FUNERAL_FAMILIAR_PAIS.value!;
    }

    final iof = _seguroVida.valorTotal * 0.38 / 100.0;

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
                    "${NumberFormat.currency(locale: "pt_BR", symbol: "R\$").format(_seguroVida.valorTotal)} / mês",
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
                _seguroVida.formaPagamento!.value!,
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
                hoje,
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
                        NumberFormat.currency(locale: "pt_BR", symbol: "R\$")
                            .format(8.62),
                        style: TextStyles.text,
                      ),
                    ],
                  ),
                  Text(
                    NumberFormat.currency(locale: "pt_BR", symbol: "R\$")
                        .format(_seguroVida.cobertura),
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
            Visibility(
              visible: _seguroVida.seguros.length > 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 24,
                    ),
                    child: Text(
                      "Coberturas Extras",
                      style: TextStyles.textGreyBold,
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _seguroVida.seguros.length,
                    itemBuilder: (context, index) {
                      String badgeValue =
                          NumberFormat.currency(locale: "pt_BR", symbol: "R\$")
                              .format(_seguroVida.seguros[index].value!);
                      if (funeralFamiliar != null &&
                          (_seguroVida.seguros[index] ==
                                  SeguroVidaEnum.FUNERAL_FAMILIAR_PAIS ||
                              _seguroVida.seguros[index] ==
                                  SeguroVidaEnum
                                      .FUNERAL_FAMILIAR_CONJUGE_FILHOS)) {
                        badgeValue = NumberFormat.currency(
                                locale: "pt_BR", symbol: "R\$")
                            .format(funeralFamiliar);
                      }
                      return CardSeguroVidaWidget(
                        title: _seguroVida.seguros[index].name!,
                        badge: badgeValue,
                        showBadgeBackground: false,
                        showSwitch: false,
                        subtitle1:
                            "Caso sofra algum acidente e precise ficar no hospital pelo menos 48h, você recebe uma diária de R\$ 150,00 para usar como quiser.",
                        subtitle2: "",
                        onTap: null,
                      );
                    },
                  ),
                ],
              ),
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
                    NumberFormat.currency(locale: "pt_BR", symbol: "R\$")
                        .format(_seguroVida.valorTotal - iof),
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
                    NumberFormat.currency(locale: "pt_BR", symbol: "R\$")
                        .format(iof),
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
                    NumberFormat.currency(locale: "pt_BR", symbol: "R\$")
                        .format(_seguroVida.valorTotal),
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
                    "Já está incluso nesse valor a remuneração do Nubank, que é uma taxa de 35% do pagamento mensal líquido, igual a ${NumberFormat.currency(locale: "pt_BR", symbol: "R\$").format((_seguroVida.valorTotal - iof) * 0.35)}",
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
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(
                              context,
                              "/seguro_vida_funcionamento",
                            );
                          },
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
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(
                            context,
                            "/seguro_vida_termos",
                          );
                        },
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
