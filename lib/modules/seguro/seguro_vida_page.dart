import 'package:flutter/material.dart';
import 'package:nubank/shared/models/ajuda_params.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_images.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/button_nu/button_nu_widget.dart';
import 'package:nubank/shared/widgets/card_whatsapp/card_whatsapp_widget.dart';
import 'package:nubank/shared/widgets/circle_icon_button/circle_icon_button_widget.dart';

class SeguroVidaPage extends StatefulWidget {
  const SeguroVidaPage({Key? key}) : super(key: key);

  @override
  _SeguroVidaPageState createState() => _SeguroVidaPageState();
}

class _SeguroVidaPageState extends State<SeguroVidaPage> {
  var controller = ScrollController();
  ScrollPhysics physics = ClampingScrollPhysics();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.position.pixels <= 56) {
        physics = ClampingScrollPhysics();
      } else {
        physics = BouncingScrollPhysics();
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: SingleChildScrollView(
          controller: controller,
          physics: physics,
          child: Stack(
            children: [
              Image.asset(
                AppImages.seguro_vida,
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleIconButtonWidget(
                      icon: Icons.chevron_left_outlined,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      padding: 4,
                      background: Colors.black,
                      iconSize: 20,
                    ),
                    Tooltip(
                      message: "Ajuda",
                      child: CircleIconButtonWidget(
                        icon: Icons.help_outline,
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            "/ajuda_home",
                            arguments: AjudaParams(
                              title: "Seguro de vida",
                              jsonFile: "seguro_vida.json",
                            ),
                          );
                        },
                        padding: 4,
                        background: Colors.black,
                        iconSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 32,
                    ),
                    child: Text(
                      "Nubank Vida",
                      style: TextStyles.textBigBold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    child: Text(
                      "Finalmente um seguro de vida simples e acess??vel para voc??, com transpar??ncia em todas as etapas.",
                      style: TextStyles.textBold,
                    ),
                  ),
                  Opacity(
                    opacity: 1,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/seguro_vida_info");
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Conhecer mais",
                              style: TextStyles.textNuBold,
                            ),
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
                      style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                      ),
                    ),
                  ),
                  CardWhatsappWidget(
                    icon: Icons.phone_android_outlined,
                    size: 40,
                    padding: 20,
                    iconColor: Colors.black54,
                    title: "Simples como deve ser",
                    subtitle:
                        "Tudo feito de um jeito para que voc?? saiba exatamente o que est?? contratando.",
                  ),
                  CardWhatsappWidget(
                    icon: Icons.local_atm_outlined,
                    size: 40,
                    padding: 20,
                    iconColor: Colors.black54,
                    title: "Pre??o que cabe no bolso",
                    subtitle:
                        "Pre??o m??dio inicial de R\$ 9 por m??s, sem tarifas escondidas e sem ajustes de pre??o por idade durante 5 anos. Simples assim.",
                  ),
                  CardWhatsappWidget(
                    icon: Icons.edit_outlined,
                    size: 40,
                    padding: 20,
                    iconColor: Colors.black54,
                    title: "Coberturas personaliz??veis e ??teis para voc??",
                    subtitle:
                        "Monte seu seguro com coberturas que fazem a diferen??a para voc?? e para o seu momento de vida.",
                  ),
                  CardWhatsappWidget(
                    icon: Icons.headset_mic_outlined,
                    size: 40,
                    padding: 20,
                    iconColor: Colors.black54,
                    title: "Se voc?? precisar, estaremos aqui",
                    subtitle:
                        "Facilidade para acionar o seguro pelo aplicativo ou telefone, com um time 100% dedicado a realmente te dar suporte se voc?? precisar.",
                  ),
                  Container(
                    color: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        "A aceita????o do seguro estar?? sujeita ?? an??lise do risco.",
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              ButtonNuWidget(
                text: "Simular meu seguro",
                onPressed: () {
                  Navigator.pushNamed(context, "/seguro_vida_simular");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
