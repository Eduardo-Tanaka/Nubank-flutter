import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/bottom_card_menu/bottom_card_menu_widget.dart';
import 'package:nubank/shared/widgets/card_menu/card_menu_widget.dart';
import 'package:nubank/shared/widgets/circle_icon_button/circle_icon_button_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titles = [
      "Pix",
      "Pagar",
      "Indicar\namigos",
      "Transferir",
      "Depositar",
      "Empréstimos",
      "Cartão\nvirtual",
      "Recarga de\ncelular",
      "Ajustar limite",
      "Bloquear cartão",
      "Cobrar",
      "Doação",
      "Me ajuda",
    ];
    final icons = [
      FontAwesomeIcons.asterisk,
      FontAwesomeIcons.barcode,
      Icons.person_add_alt_1,
      Icons.arrow_upward,
      Icons.arrow_downward,
      FontAwesomeIcons.handHoldingUsd,
      FontAwesomeIcons.creditCard,
      FontAwesomeIcons.mobile,
      FontAwesomeIcons.slidersH,
      FontAwesomeIcons.lock,
      FontAwesomeIcons.commentDollar,
      FontAwesomeIcons.handHoldingUsd,
      FontAwesomeIcons.questionCircle,
    ];
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Padding(
          padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
          child: Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Olá, Eduardo",
                  style: TextStyles.titleHome,
                ),
                Row(
                  children: [
                    CircleIconButtonWidget(
                      icon: Icons.visibility_off_outlined,
                      onPressed: () {},
                    ),
                    CircleIconButtonWidget(
                      icon: Icons.settings_outlined,
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(FontAwesomeIcons.whatsapp),
                        title: Transform.translate(
                          offset: Offset(-20, 0),
                          child: Text('Pagamentos no WhatsApp'),
                        ),
                      ),
                      Text(
                        "Envie e receba dinheiro sem sair da conversa",
                        style: TextStyles.textBold,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                        child: Text(
                            'Os pagamentos no WhatsApp são seguros, rápidos e sem tarifas. Tão fácil quanto mandar uma foto de "bom dia!" no grupo da família.'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text("Quero conhecer"),
                        style: TextButton.styleFrom(
                          primary: Colors.purple,
                          side: BorderSide(color: Colors.purple, width: 1),
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                    ],
                  ),
                ),
              ),
              CardMenuWidget(
                icon: FontAwesomeIcons.creditCard,
                title: 'Cartão de Crédito',
                subtitle: 'Fatura atual',
                info1: 'R\$ 435,36',
                info1Style: TextStyles.textMoneyBlue,
                info2: 'Limite disponível ',
                info2Span: 'R\$ 3.564,64',
                info2SpanStyle: TextStyles.textMoneyGreen,
              ),
              CardMenuWidget(
                icon: FontAwesomeIcons.dollarSign,
                title: 'Conta',
                subtitle: 'Saldo Disponível',
                info1: 'R\$ 8435,36',
                info1Style: TextStyles.textBold,
              ),
              CardMenuWidget(
                icon: FontAwesomeIcons.handHoldingUsd,
                title: 'Empréstimo',
                subtitle: '',
                info2: 'Valor disponível de até \n',
                info2Span: 'R\$ 25.000,00',
                info2SpanStyle: TextStyles.textBold,
                textButton: 'SIMULAR EMPRÉSTIMO',
              ),
              CardMenuWidget(
                icon: FontAwesomeIcons.gift,
                title: 'Rewards',
                subtitle: 'Total',
                info1: '1.536 pts',
                info1Style: TextStyles.textBold,
                info2: 'Você acumulou ',
                info2Span: '1.533',
                info2SpanStyle: TextStyles.textMoneyGreen,
                info2Cont: ' pontos esse mês.',
              ),
              CardMenuWidget(
                icon: FontAwesomeIcons.signal,
                title: 'Investimentos',
                subtitle: '',
                info2:
                    'A revolução roxa começou. Invista de maneira simples, sem burocracia e 100% digital.',
                info2Style: TextStyles.text,
                textButton: 'CONHECER',
              ),
              CardMenuWidget(
                icon: FontAwesomeIcons.creditCard,
                title: 'Google Pay',
                subtitle: '',
                info2: 'Use o Google Pay com seus cartões Nubank.',
                info2Style: TextStyles.text,
                textButton: 'REGISTRAR MEU CARTÃO',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 12, left: 14, right: 14),
        child: SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, position) {
              return BottomCardMenuWidget(
                icon: icons[position],
                title: titles[position],
                onTap: () {},
              );
            },
            itemCount: titles.length,
          ),
        ),
      ),
    );
  }
}
