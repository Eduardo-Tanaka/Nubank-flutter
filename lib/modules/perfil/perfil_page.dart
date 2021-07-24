import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/button_nu/button_nu_widget.dart';
import 'package:nubank/shared/widgets/circle_icon_button/circle_icon_button_widget.dart';

final icons = [
  Icons.help_outline_outlined,
  Icons.person_outline_outlined,
  Icons.tune_outlined,
  FontAwesomeIcons.asterisk,
  Icons.business_outlined,
  Icons.notifications_outlined,
  Icons.payment_outlined,
  Icons.phone_android_outlined,
  Icons.card_giftcard_outlined,
  Icons.text_snippet_outlined,
];

final title = [
  "Me ajuda",
  "Meus dados",
  "Configurar app",
  "Configurar chave Pix",
  "Pedir conta Pj",
  "Notificações",
  "Configurar conta",
  "Configurar cartão",
  "Configurar Rewards",
  "Sobre",
];

final routes = [
  "/ajuda",
  "/meus_dados",
  "/configurar_app",
  "/pix_chaves",
  "/conta_pj",
  "/notificacoes",
  "configurar_conta",
  "configurar_cartao",
  "configurar_rewards",
  "/sobre",
];

class PerfilPage extends StatelessWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          stops: [1, 0],
          colors: [
            Colors.grey[200]!,
            Colors.white,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(8.0),
          child: AppBar(
            backgroundColor: Colors.grey[200],
            leading: Icon(null),
            elevation: 0,
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.grey[200],
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        visualDensity: VisualDensity.compact,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 20,
                              top: 12,
                              bottom: 20,
                            ),
                            child: CircleIconButtonWidget(
                              icon: Icons.person_outline,
                              padding: 14,
                              onPressed: () {},
                            ),
                          ),
                          Text(
                            "Eduardo",
                            style: TextStyles.textBlack,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 12,
                          bottom: 4,
                        ),
                        child: Text(
                          "Agência xxxx - Conta xxxxxx-x",
                          style: TextStyles.textBlackSmall,
                        ),
                      ),
                      Text(
                        "Banco 0260 - Nu Pagamentos S.A",
                        style: TextStyles.textBlackSmall,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: icons.length,
                  itemBuilder: (context, position) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Icon(
                          icons[position],
                          color: Colors.black,
                        ),
                        title: Text(
                          title[position],
                          style: TextStyles.textBlack,
                        ),
                        trailing: Icon(
                          Icons.chevron_right_outlined,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, routes[position]);
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, position) {
                    return Divider(
                      height: 1,
                      thickness: 1,
                    );
                  },
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                  right: 20,
                  left: 20,
                  bottom: 20,
                ),
                child: ButtonNuWidget(
                  text: "Sair do aplicativo",
                  color: Colors.grey[300],
                  textColor: Colors.black,
                  onPressed: () {
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
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
