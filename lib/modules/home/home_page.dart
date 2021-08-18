import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/circle_icon_button/circle_icon_button_widget.dart';
import 'package:nubank/shared/widgets/home_card/home_card_descubra_widget.dart';
import 'package:nubank/shared/widgets/home_card/home_card_icon_widget.dart';
import 'package:nubank/shared/widgets/home_card/home_card_text_widget.dart';
import 'package:nubank/shared/widgets/home_card/home_card_widget.dart';

import '../../custom_font_app_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isVisible = true;
  final titles = [
    "Pix",
    "Pagar",
    "Transferir",
    "Depositar",
    "Pegar\nemprestado",
    "Recarga de\ncelular",
    "Cobrar",
    "Doação",
    "Encontrar \natalhos",
  ];
  final icons = [
    CustomFontApp.pix,
    CustomFontApp.barcode,
    CustomFontApp.cash_plus,
    CustomFontApp.cash_minus,
    CustomFontApp.personal_loan,
    CustomFontApp.recharge_phone,
    CustomFontApp.cobrar,
    Icons.favorite_border_outlined,
    Icons.help_outline,
  ];
  final routes = [
    "/pix",
    "/pagar",
    "/transferir",
    "/depositar",
    "/emprestimo_objetivo",
    "/recarga",
    "/cobrar",
    "/doacao",
    "/ajuda",
  ];

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            stops: [1, 0],
            colors: [
              AppColors.primary,
              Colors.white,
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(8.0),
            child: AppBar(
              backgroundColor: AppColors.primary,
              leading: Icon(null),
              elevation: 0,
            ),
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 140,
                    color: AppColors.primary,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 8,
                        bottom: 20,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleIconButtonWidget(
                                icon: CustomFontApp.user,
                                padding: 14,
                                onPressed: () {
                                  Navigator.pushNamed(context, "/perfil");
                                },
                              ),
                              Row(
                                children: [
                                  CircleIconButtonWidget(
                                    icon: isVisible
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    padding: 8,
                                    background: AppColors.primary,
                                    onPressed: () {
                                      setState(() {
                                        isVisible = !isVisible;
                                      });
                                    },
                                  ),
                                  CircleIconButtonWidget(
                                    icon: Icons.help_outline,
                                    padding: 8,
                                    background: AppColors.primary,
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        "/ajuda",
                                      );
                                    },
                                  ),
                                  CircleIconButtonWidget(
                                    icon: CustomFontApp.email_plus_outline,
                                    padding: 8,
                                    background: AppColors.primary,
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        "/indicar_amigos",
                                      );
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "Olá, Eduardo",
                              style: TextStyles.titleHome,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: ListTile(
                          title: Text(
                            "Conta",
                            style: TextStyles.textBold,
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Container(
                              color: isVisible ? null : Colors.grey[200],
                              child: Text(
                                isVisible ? "R\$ 5.000,00" : "",
                                style: TextStyles.titleBlackBold,
                              ),
                            ),
                          ),
                          trailing: Icon(Icons.chevron_right),
                          onTap: () {
                            Navigator.pushNamed(context, "/conta");
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
                    child: SizedBox(
                      height: 130,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, position) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    CircleIconButtonWidget(
                                      icon: icons[position],
                                      onPressed: () {
                                        Navigator.pushNamed(
                                          context,
                                          routes[position],
                                        );
                                      },
                                      background: Colors.grey[200],
                                      color: Colors.black,
                                      padding: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 16),
                                      child: Text(
                                        titles[position],
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                                Visibility(
                                  visible: position == titles.length - 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 17,
                                      top: 50,
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: new BoxDecoration(
                                        color: AppColors.primary,
                                        border: Border.all(
                                            color: Colors.black, width: 0.0),
                                        borderRadius: new BorderRadius.all(
                                            Radius.elliptical(4, 4)),
                                      ),
                                      child: Text(
                                        "Dica",
                                        style: TextStyles.titleBottomMenu,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: titles.length,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    child: HomeCardIconWidget(
                      text: "Meus cartões",
                      icon: CustomFontApp.phone,
                      isVisible: isVisible,
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          "/meus_cartoes",
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    child: SizedBox(
                      height: 90,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        children: [
                          HomeCardTextWidget(
                            text: "Você tem R\$ 25.000,00 disponíveis para ",
                            textNu: "empréstimo.",
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                "/emprestimo_objetivo",
                              );
                            },
                          ),
                          HomeCardTextWidget(
                            text:
                                "Conquiste planos futuros: conheça as opções para ",
                            textNu: "guardar dinheiro.",
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                    ),
                  ),
                  HomeCardWidget(
                    isVisible: isVisible,
                    isVisibleInfo: true,
                    icon: CustomFontApp.phone,
                    title: "Cartão de crédito",
                    subTitle: "Fatura atual",
                    value: "R\$ 5.000,00",
                    info: "Limite disponível de R\$ 4.000,00",
                    onTap: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: HomeCardIconWidget(
                      text: "Rewards",
                      textRight: "3.800 pts",
                      isVisible: isVisible,
                      icon: Icons.card_giftcard_outlined,
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                    ),
                  ),
                  HomeCardWidget(
                    isVisible: isVisible,
                    isVisibleInfo: isVisible,
                    icon: CustomFontApp.personal_loan,
                    title: "Empréstimo",
                    subTitle: "Valor disponível de até",
                    info: "R\$ 30.000,00",
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "/emprestimo",
                      );
                    },
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  HomeCardWidget(
                    isVisible: true,
                    isVisibleInfo: true,
                    icon: Icons.signal_cellular_alt_outlined,
                    title: "Investimentos",
                    subTitle:
                        "A revolução roxa começou. Invista de maneira simples, sem burocracia e 100% digital.",
                    showButton: true,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "/investimentos",
                      );
                    },
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  HomeCardWidget(
                    isVisible: true,
                    isVisibleInfo: true,
                    icon: Icons.favorite_outline,
                    title: "Seguro de vida",
                    subTitle:
                        "Conheça Nubank Vida: um seguro simples e que cabe no bolso.",
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "/seguro_vida",
                      );
                    },
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    child: Text(
                      "Descubra mais",
                      style: TextStyles.textBold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: SizedBox(
                      height: 210,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.25,
                            child: HomeCardDescubraWidget(
                              title: "WhatsApp",
                              subtitle:
                                  "Pagamentos seguros, rápidos e sem tarifa. A experiência Nubank sem nem sair da conversa.",
                              chipText: "Quero conhecer",
                              isNew: true,
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  "/whatsapp_cadastrar",
                                );
                              },
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.25,
                            child: HomeCardDescubraWidget(
                              title: "Indique seus amigos",
                              subtitle:
                                  "Mostre aos seus amigos como é fácil ter uma vida sem burocracia.",
                              chipText: "Indicar amigos",
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  "/indicar_amigos",
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
