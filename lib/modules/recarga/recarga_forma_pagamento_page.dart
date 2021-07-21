import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/tile/tile_widget.dart';

class RecargaFormaPagamentoPage extends StatelessWidget {
  final String saldo = "R\$ 2.000,00";
  final String limite = "R\$ 3.000,00";

  const RecargaFormaPagamentoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            subtitle: "Saldo disponível: $saldo",
            iconLeading: Icons.add_to_queue,
            onTap: () {
              Navigator.pushNamed(
                context,
                "/recarga_valor",
                arguments: "Saldo disponível: $saldo",
              );
            },
          ),
          TileWidget(
            title: "Cartão de Crédito",
            subtitle: "Limite disponível: $limite",
            iconLeading: Icons.tablet_android,
            onTap: () {
              Navigator.pushNamed(
                context,
                "/recarga_valor",
                arguments: "Limite disponível: $limite",
              );
            },
          ),
        ],
      ),
    );
  }
}
