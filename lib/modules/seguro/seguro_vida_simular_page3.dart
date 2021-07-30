import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/tile/tile_widget.dart';

class SeguroVidaSimularPage3 extends StatelessWidget {
  const SeguroVidaSimularPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        value: 0.75,
        linearProgressWidth: null,
        icon: Icons.navigate_before,
        showTrailingIcon: true,
        trailingIcon: Icons.help_outline,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  "Escolha a forma de pagamento",
                  style: TextStyles.textBigBold,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "A cobrança é feita, mensalmente, através da forma de pagamento que você escolher.",
                  style: TextStyles.textGreyBold,
                ),
                SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
          TileWidget(
            iconLeading: Icons.phone_android_outlined,
            title: "Cartão de crédito do Nubank",
            subtitle: "Vencimento da fatura em xx XXX",
            onTap: () {},
          ),
          TileWidget(
            iconLeading: Icons.local_atm_outlined,
            title: "Conta do Nubank",
            subtitle: "Seu saldo atual é de R\$ 2.000,00",
            onTap: () {},
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Você poderá revisar os detalhes de seu seguro de vida masi tarde.",
              style: TextStyles.textGreySmall,
            ),
          ),
        ],
      ),
    );
  }
}
