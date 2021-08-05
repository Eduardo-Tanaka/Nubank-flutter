import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:nubank/shared/models/ajuda_params.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';

class DoacaoPage extends StatelessWidget {
  const DoacaoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: espera(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.only(
                top: 60,
                bottom: 16,
                left: 20,
                right: 20,
              ),
              child: AnimatedCard(
                direction: AnimatedCardDirection.bottom,
                duration: Duration(milliseconds: 300),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Doe usando seu cartão de crédito",
                      style: TextStyles.textNuTitleBold,
                      textAlign: TextAlign.center,
                    ),
                    Column(
                      children: [
                        Text(
                          "Para fortalecer nossas iniciativas no combate ao coronavírus, estendemos este convite a você também.",
                          style: TextStyles.textBlack,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Através do aplicativo, agora você pode fazer doações para recursos médicos (Cruz Vermelha e Hospital das Clínicas de SP) ou distriubuição de alimentos em todo o país (Ação da Cidadania Única das Favelas).",
                          style: TextStyles.textBlack,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              "/ajuda_home",
                              arguments: AjudaParams(
                                title: "Doações",
                                jsonFile: "doacao.json",
                              ),
                            );
                          },
                          child: Text(
                            "Saiba mais >",
                            style: TextStyles.textNuSmallBold,
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "QUERO DOAR",
                                style: TextStyles.textNuSmallBold,
                              ),
                            ],
                          ),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(20),
                            primary: Colors.black87,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                              side: BorderSide(
                                color: Color(0xFF820ad1),
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            ),
          );
        }
      },
    );
  }

  Future espera() async {
    return Future.delayed(
      Duration(seconds: 1),
    );
  }
}
