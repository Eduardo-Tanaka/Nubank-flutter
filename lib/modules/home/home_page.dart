import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/circle_icon_button/circle_icon_button_widget.dart';

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
    FontAwesomeIcons.mobile,
    FontAwesomeIcons.commentDollar,
    Icons.favorite_border_outlined,
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
  ];

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: Scaffold(
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
          child: Column(
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
                            onPressed: () {},
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
              InkWell(
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
                          style: TextStyles.titleBlack,
                        ),
                      ),
                    ),
                    trailing: Icon(Icons.chevron_right),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                child: SizedBox(
                  height: 140,
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
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone_android_outlined,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Meus cartões",
                          style: TextStyles.textBlack,
                        ),
                      )
                    ],
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    padding: EdgeInsets.all(16),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    primary: Colors.black87,
                    elevation: 0,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: SizedBox(
                  height: 90,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Você tem R\$ 25.000,00 disponíveis para empréstimo.",
                                style: TextStyles.textBlack,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.grey[200],
                              padding: EdgeInsets.all(16),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              primary: Colors.black87,
                              elevation: 0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Conquiste planos futuros: conheça as opções para guardar dinheiro.",
                                style: TextStyles.textBlack,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.grey[200],
                              padding: EdgeInsets.all(16),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              primary: Colors.black87,
                              elevation: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Divider(
                  height: 1,
                  thickness: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
