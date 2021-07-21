import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/button_nu/button_nu_widget.dart';
import 'package:nubank/shared/widgets/radio_button/radio_button_widget.dart';
import 'package:nubank/shared/widgets/tile_recarga/tile_recarga_widget.dart';

class RecargaResumoPage extends StatefulWidget {
  const RecargaResumoPage({Key? key}) : super(key: key);

  @override
  _RecargaResumoPageState createState() => _RecargaResumoPageState();
}

class _RecargaResumoPageState extends State<RecargaResumoPage> {
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('dd/MM/yyyy');
  final DateFormat formatter2 = DateFormat('dd MMM yyyy');

  bool lembrete = false;
  double opacity = 1;

  final List<String> datas = [
    "Em 1 semana",
    "Em 2 semanas",
    "Em 3 semanas",
    "Em 1 mês",
    "Em 2 meses",
  ];
  String radioValue = "Em 1 mês";

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    final String hoje = formatter.format(now);

    final List<String> datas2 = [
      formatter2.format(now.add(Duration(days: 7))),
      formatter2.format(now.add(Duration(days: 14))),
      formatter2.format(now.add(Duration(days: 21))),
      formatter2.format(now.add(Duration(days: 30))),
      formatter2.format(now.add(Duration(days: 60))),
    ];
    return Scaffold(
      appBar: AppBarWidget(
        value: 1.0,
        icon: Icons.navigate_before,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    "Você está recarregando",
                    style: TextStyles.textBigBold,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {},
                onTapDown: (TapDownDetails details) {
                  setState(() {
                    opacity = 0.4;
                  });
                },
                onTapCancel: () {
                  setState(() {
                    opacity = 1.0;
                  });
                },
                child: Opacity(
                  opacity: opacity,
                  child: Row(
                    children: [
                      Text(
                        args,
                        style: TextStyles.textNuBigBold,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Icon(
                          Icons.edit_outlined,
                          color: AppColors.background,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            TileRecargaWidget(
              title: "Número",
              subtitle: "(11) 97768-0028",
              onPressed: () {},
            ),
            TileRecargaWidget(
              title: "Operadora",
              subtitle: "Claro",
              onPressed: () {},
            ),
            TileRecargaWidget(
              title: "Pagando com",
              subtitle: "Cartão de Crédito",
              onPressed: () {},
            ),
            TileRecargaWidget(
              title: "Data da recarga",
              subtitle: hoje,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  child: ListTile(
                    title: Text("Lembrete de recarga"),
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                )
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  child: ListTile(
                    title: Text(
                      "Crie um lembrete para repetir essa recarga",
                      style: TextStyles.textBold,
                    ),
                    trailing: Switch(
                      activeColor: AppColors.background,
                      value: lembrete,
                      onChanged: (value) {
                        setState(() {
                          lembrete = value;
                        });
                      },
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                )
              ],
            ),
            Visibility(
              visible: lembrete,
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      isDismissible: true,
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0),
                        ),
                      ),
                      builder: (context) {
                        return SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 16,
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Text(
                                  "Quando você quer receber o lembrete?",
                                  style: TextStyles.titleBlack,
                                ),
                              ),
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: datas.length,
                                itemBuilder: (cc, i) {
                                  return RadioButtonWidget(
                                    value: datas[i],
                                    trailingText: datas2[i],
                                    groupValue: radioValue,
                                    showDivider: false,
                                    onTap: () {
                                      setState(() {
                                        radioValue = datas[i];
                                        Navigator.pop(context);
                                      });
                                    },
                                    onChanged: (value) {
                                      setState(() {
                                        radioValue = datas[i];
                                      });
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: TileRecargaWidget(
                  title: "Lembrar em",
                  subtitle: radioValue,
                  onPressed: () {},
                  trailing: true,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 10,
        color: Colors.white,
        child: Container(
          height: 140,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: [
                ButtonNuWidget(
                  text: "Confirmar Pagamento",
                  onPressed: () {},
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    "Lembrando que essa transação não gera pontos no Nubank Rewards.",
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
