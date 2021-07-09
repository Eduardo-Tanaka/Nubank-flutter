import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/tile/tile_widget.dart';

class RecargaFormaPagamentoPage extends StatelessWidget {
  const RecargaFormaPagamentoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        value: 0.6,
        icon: Icons.navigate_before,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 8,
            ),
            child: Text(
              "Escolha a forma de pagamento",
              style: TextStyles.textBigBold,
            ),
          ),
          TileWidget(
            title: "Conta do Nubank",
            subtitle: "Saldo disponível: R\$ 2.000,00",
            iconLeading: Icons.add_to_queue,
            onTap: () {},
          ),
          TileWidget(
            title: "Cartão de Crédito",
            subtitle: "Limite disponível: R\$ 3.000,00",
            iconLeading: Icons.tablet_android,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
