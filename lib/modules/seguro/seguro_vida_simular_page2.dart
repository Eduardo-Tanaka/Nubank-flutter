import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/button_nu/button_nu_widget.dart';
import 'package:nubank/shared/widgets/card_seguro_vida/card_seguro_vida_widget.dart';
import 'package:nubank/shared/widgets/card_seguro_vida/seguro_vida_checkbox_widget.dart';

class SeguroVidaSimularPage2 extends StatefulWidget {
  const SeguroVidaSimularPage2({Key? key}) : super(key: key);

  @override
  _SeguroVidaSimularPage2State createState() => _SeguroVidaSimularPage2State();
}

class _SeguroVidaSimularPage2State extends State<SeguroVidaSimularPage2> {
  double cobertura = 100000;
  double total = 8.62;
  bool hospitalizacao = false;
  bool invalidez = false;
  bool familiar1 = false;
  bool familiar2 = false;
  double enabledThumbRadius = 10;

  List<String> familiares = [
    "Cônjuge e filhos",
    "Pais (do titular)",
  ];
  List<double> valores = [
    1.07,
    12.34,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        value: 0.5,
        linearProgressWidth: null,
        icon: Icons.navigate_before,
        showTrailingIcon: true,
        trailingIcon: Icons.help_outline,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Agora, escolha as coberturas do seu seguro",
                        style: TextStyles.titleBlackBold,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 32),
                        child: Text(
                          "Valor da cobertura por morte do titular",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          NumberFormat.currency(locale: "pt_BR", symbol: "R\$")
                              .format(cobertura),
                          style: TextStyles.textAjudaBold,
                        ),
                      ),
                    ],
                  ),
                ),
                SliderTheme(
                  data: SliderThemeData(
                    overlayColor: Colors.transparent,
                    activeTrackColor: AppColors.primary,
                    inactiveTrackColor: Colors.grey[200],
                    thumbColor: AppColors.primary,
                    inactiveTickMarkColor: Colors.transparent,
                    activeTickMarkColor: Colors.transparent,
                    thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: enabledThumbRadius),
                  ),
                  child: Slider(
                    min: 25000,
                    max: 150000,
                    divisions: 5,
                    value: cobertura,
                    onChanged: (value) {
                      setState(() {
                        cobertura = value;
                      });
                    },
                    onChangeStart: (value) {
                      enabledThumbRadius = 20;
                      setState(() {});
                    },
                    onChangeEnd: (value) {
                      enabledThumbRadius = 10;
                      setState(() {});
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "R\$ 25 mil",
                        style: TextStyles.textBlackSmall,
                      ),
                      Text(
                        "R\$ 150 mil",
                        style: TextStyles.textBlackSmall,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Text(
                          "Há uma carência de 90 dias para morte natural. Para morte acidental, não há carência.",
                          style: TextStyles.textGreySmallBold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 12,
                        ),
                        child: Text(
                          "Os benficiários são definidos nas próximas etapas.",
                          style: TextStyles.textGreySmallBold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            "/seguro_vida_detalhe_morte_natural_acidental",
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              "Ver detalhes",
                              style: TextStyles.textNuSmallBold,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Icon(
                                Icons.arrow_forward_outlined,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Divider(
                height: 1,
              ),
            ),
            CardSeguroVidaWidget(
              title: "Assistência funeral do titular",
              badge: "íncluído",
              showSwitch: false,
              subtitle1:
                  "Há uma carência de 90 dias para morte natural. Para morte acidental, não há carência.",
              subtitle2: "Os beneficiários são definidos nas próximas etapas.",
              onTap: () {
                Navigator.pushNamed(
                  context,
                  "/seguro_vida_detalhe_funeral_titular",
                );
              },
            ),
            CardSeguroVidaWidget(
              title: "Hospitalização",
              badge: "+R\$1,38",
              subtitle1:
                  "Caso sofra algum acidente e precise ficar no hospital pelo menos 48h, você recebe uma diária de R\$ 150,00 para usar como quiser.",
              subtitle2: "",
              switchValue: hospitalizacao,
              onChanged: (value) {
                hospitalizacao = !hospitalizacao;
                setState(() {
                  if (hospitalizacao) {
                    total = total + 1.38;
                  } else {
                    total = total - 1.38;
                  }
                });
              },
              onTap: () {
                Navigator.pushNamed(
                  context,
                  "/seguro_vida_detalhe_hospitalizacao",
                );
              },
            ),
            CardSeguroVidaWidget(
              title: "Invalidez",
              badge: "+R\$2,63",
              subtitle1:
                  "Receba até 100% do valor da cobertura do seu seguro no caso de invalidez total ou parcial por acidente.",
              subtitle2: "",
              switchValue: invalidez,
              onChanged: (value) {
                invalidez = !invalidez;
                setState(() {
                  if (invalidez) {
                    total = total + 2.63;
                  } else {
                    total = total - 2.63;
                  }
                });
              },
              onTap: () {
                Navigator.pushNamed(
                  context,
                  "/seguro_vida_detalhe_invalidez",
                );
              },
            ),
            CardSeguroVidaWidget(
              title: "Assistência funeral de familiares",
              badge: "",
              subtitle1:
                  "É possível escolher entre a prestação do serviço funeral ou reembolso dos custos de R\$ 5.000,00 de cobretura, para cada familiar.",
              subtitle2:
                  "Há uma carência de 90 dias para morte natural. Para morte acidental não há carência.",
              familiares: familiares,
              checkbox1: SeguroVidaCheckboxWidget(
                title: familiares[0],
                badge:
                    "+${NumberFormat.currency(locale: "pt_BR", symbol: "R\$").format(valores[0])}",
                value: familiar1,
                onTap: () {
                  familiar1 = !familiar1;
                  setState(() {
                    if (familiar1) {
                      total = total + valores[0];
                    } else {
                      total = total - valores[0];
                    }
                  });
                },
              ),
              checkbox2: SeguroVidaCheckboxWidget(
                title: familiares[1],
                badge:
                    "+${NumberFormat.currency(locale: "pt_BR", symbol: "R\$").format(valores[1])}",
                value: familiar2,
                onTap: () {
                  familiar2 = !familiar2;
                  setState(() {
                    if (familiar2) {
                      total = total + valores[1];
                    } else {
                      total = total - valores[1];
                    }
                  });
                },
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  "/seguro_vida_detalhe_funeral_familiar",
                );
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 10,
        color: Colors.white,
        child: Container(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${NumberFormat.currency(locale: "pt_BR", symbol: "R\$").format(total)} / mês",
                    style: TextStyles.textBold,
                  ),
                  Text(
                    "Sem tarifas escondidas",
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                child: ButtonNuWidget(
                  text: "Continuar",
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      "/seguro_vida_simular3",
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
