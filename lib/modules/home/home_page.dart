import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/circle_icon_button/circle_icon_button_widget.dart';
import 'package:nubank/shared/widgets/home_card/home_card_descubra_widget.dart';
import 'package:nubank/shared/widgets/home_card/home_card_icon_widget.dart';
import 'package:nubank/shared/widgets/home_card/home_card_text_widget.dart';
import 'package:nubank/shared/widgets/home_card/home_card_widget.dart';

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
    "Empréstimos",
    "Recarga de\ncelular",
    "Cobrar",
    "Doação",
    "Me ajuda",
  ];
  final icons = [
    FontAwesomeIcons.asterisk,
    FontAwesomeIcons.barcode,
    Icons.arrow_upward,
    Icons.arrow_downward,
    FontAwesomeIcons.handHoldingUsd,
    FontAwesomeIcons.mobileAlt,
    FontAwesomeIcons.commentDollar,
    Icons.favorite_border_outlined,
    Icons.help_outline,
  ];
  final routes = [
    "/pix",
    "/pagar",
    "/transferir",
    "/depositar",
    "/emprestimo",
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
                                icon: Icons.person_outline,
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
                                    icon: Icons.forward_to_inbox_outlined,
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
                            padding: const EdgeInsets.only(left: 12),
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
                            child: Column(
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
                      icon: Icons.phone_android_outlined,
                      isVisible: isVisible,
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    child: SizedBox(
                      height: 90,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        children: [
                          HomeCardTextWidget(
                            text: "Você tem R\$ 25.000,00 disponíveis para ",
                            textNu: "empréstimo.",
                            onPressed: () {},
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
                    icon: Icons.phone_android_outlined,
                    title: "Cartão de crédito",
                    subTitle: "Fatura atual",
                    value: "R\$ 5.000,00",
                    info: "Limite disponível de R\$ 4.000,00",
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
                    icon: FontAwesomeIcons.handHoldingUsd,
                    title: "Empréstimo",
                    subTitle: "Valor disponível de até",
                    info: "R\$ 30.000,00",
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
                          HomeCardDescubraWidget(
                            title: "WhatsApp",
                            subtitle:
                                "Pagamentos seguros, rápidos e sem tarifa. A experiência Nubank sem nem sair da conversa.",
                            chipText: "Quero conhecer",
                            isNew: true,
                          ),
                          HomeCardDescubraWidget(
                            title: "Indique seus amigos",
                            subtitle:
                                "Mostre aos seus amigos como é fácil ter uma vida sem burocracia.",
                            chipText: "Indicar amigos",
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
