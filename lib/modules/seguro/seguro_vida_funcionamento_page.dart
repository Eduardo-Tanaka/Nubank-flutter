import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/button_nu/button_nu_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class SeguroVidaFuncionamentoPage extends StatelessWidget {
  const SeguroVidaFuncionamentoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nubank e Chubb",
                style: TextStyles.textBigBold,
              ),
              SizedBox(height: 32),
              Text(
                "Chubb Brasil S.A (Seguradora)",
                style: TextStyles.textBold,
              ),
              SizedBox(height: 8),
              Text(
                "CNPJ 03.502.099/0001-18",
                style: TextStyles.textGrey,
              ),
              Text.rich(
                TextSpan(
                  text: "Ouvidoria Chubb S.A. ",
                  style: TextStyles.textGrey,
                  children: [
                    TextSpan(
                        text: "0800 722 5059", style: TextStyles.textGreyBold),
                  ],
                ),
              ),
              SizedBox(height: 32),
              Text(
                "Nu Produtos Ltda (Estipulante)",
                style: TextStyles.textBold,
              ),
              SizedBox(height: 8),
              Text(
                "CNPJ 38.409.198/0001-34",
                style: TextStyles.textGrey,
              ),
              Text.rich(
                TextSpan(
                  text: "Ouvidoria Nu Produtos Ltda ",
                  style: TextStyles.textGrey,
                  children: [
                    TextSpan(
                        text: "0800 887 0463", style: TextStyles.textGreyBold),
                  ],
                ),
              ),
              SizedBox(height: 32),
              Text(
                "Processo SUSESP do produto: xxxxx.xxxxxxx/xxxx-xx. O registro deste plano na SUSEP não implica, por parte da Autarquia, incentivo ou recomendação a sua comercialização.",
                style: TextStyles.textGrey,
              ),
              SizedBox(height: 32),
              Text.rich(
                TextSpan(
                  text:
                      "As condições contratuais/regulamento deste produto protocolizadas pela sociedade/ entidade junto à Susep poderão ser consultadas no endereço eletrônico ",
                  style: TextStyles.textGrey,
                  children: [
                    TextSpan(
                      text: "www.susep.gov.br",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: AppColors.primary,
                        fontSize: 18,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          final String _url = 'https://www.susep.gov.br';
                          await canLaunch(_url)
                              ? await launch(_url)
                              : throw 'Could not launch $_url';
                        },
                    ),
                    TextSpan(
                        text:
                            ", de acordo com o número de processo constante da apólice/proposta.")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ButtonNuWidget(
            onPressed: () {
              Navigator.pop(context);
            },
            text: "Entendido",
            color: Colors.grey[200],
            textColor: Colors.black,
          ),
        ),
      ),
    );
  }
}
