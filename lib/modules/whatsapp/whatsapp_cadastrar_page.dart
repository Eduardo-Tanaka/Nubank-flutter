import 'package:flutter/material.dart';
import 'package:nubank/shared/models/ajuda_params.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_images.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/button_nu/button_nu_widget.dart';
import 'package:nubank/shared/widgets/card_whatsapp/card_whatsapp_widget.dart';
import 'package:nubank/shared/widgets/home_card/home_card_descubra_widget.dart';

class WhatsappCadastrarPage extends StatelessWidget {
  const WhatsappCadastrarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        backgroundColor: AppColors.primary,
        showTrailingIcon: true,
        onPressedTrailing: () {
          Navigator.pushNamed(
            context,
            "/ajuda_home",
            arguments: AjudaParams(
              title: "Pagamentos no WhatsApp",
              jsonFile: "whatsapp.json",
            ),
          );
        },
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowGlow();
          return false;
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    color: AppColors.primary,
                    height: 360,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Envie e receba o dinheiro pelo WhatsApp sem nem precisar sair da conversa",
                          style: TextStyles.textWhiteBigBold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 24,
                        ),
                        child: Image.asset(AppImages.whatsapp, height: 300),
                      ),
                      CardWhatsappWidget(
                        icon: Icons.emoji_emotions_outlined,
                        title: "Fácil de usar",
                        subtitle:
                            "Cadastrar seu cartão Nubank no aplicativo do WhatsApp é fácil, e pagar os amigos também. Tão fácil quanto mandar uma foto de \"bom dia!\" no grupo da família",
                      ),
                      CardWhatsappWidget(
                        icon: Icons.lock_outline,
                        title: "Seguro e confiável",
                        subtitle:
                            "Seu cartão é protegido por um código de segurança único, assim suas informações são protegidas e não serão enviadas como parte das transações no WhatsApp.",
                      ),
                      CardWhatsappWidget(
                        icon: Icons.schedule_outlined,
                        title: "Disponível quando precisar",
                        subtitle:
                            "Pagamentos rápidos e sem tarifas como você já conhecia no Nubank. Em qualquer dia e a qualquer hora, mesmo no final de semana e de madrugada.",
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: HomeCardDescubraWidget(
                          title: "WhatsApp",
                          subtitle:
                              "O recurso de pagamentos no Nubank é oferecido pelo Facebook Pay e processado pelo Facebook Pagamentos e pela Cielo.",
                          onPressed: null,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 10,
        color: Colors.white,
        child: Container(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: [
                ButtonNuWidget(
                  text: "Cadastrar no Whatsapp",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
