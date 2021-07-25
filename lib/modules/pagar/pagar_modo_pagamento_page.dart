import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';

class PagarModoPagamentoPage extends StatelessWidget {
  const PagarModoPagamentoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBarWidget(
        icon: Icons.arrow_back,
      ),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Você está pagando",
                      style: TextStyles.textTitle,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        args,
                        style: TextStyles.textNuBigBold,
                      ),
                    ),
                    DottedLine(
                      direction: Axis.horizontal,
                      lineLength: 160,
                      lineThickness: 1.0,
                      dashLength: 2.0,
                      dashColor: Colors.black,
                      dashRadius: 0.0,
                      dashGapLength: 2.0,
                      dashGapColor: Colors.transparent,
                      dashGapRadius: 0.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        "Vencimento da fatura: xx XXX.",
                        style: TextStyles.textSmall,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Fatura atual",
                        style: TextStyles.textSmall,
                      ),
                      Text(
                        args,
                        style: TextStyles.textSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                child: Container(
                  child: Center(
                    child: ListTile(
                      leading: Icon(
                        Icons.monetization_on_outlined,
                        color: AppColors.primary,
                      ),
                      title: Text(
                        "Pagar com a conta do Nubank",
                      ),
                      subtitle: Text(
                        "O limite do seu cartão será liberado em até 30 minutos.",
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                child: Container(
                  child: Center(
                    child: ListTile(
                      leading: Icon(
                        FontAwesomeIcons.barcode,
                        color: AppColors.primary,
                      ),
                      title: Text(
                        "Gerar um boleto",
                      ),
                      subtitle: Text(
                        "O pagamento do boleto será reconhecido em até 3 dias úteis.",
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
