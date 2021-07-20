import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/floating_action_button/floating_action_button_widget.dart';
import 'package:nubank/shared/widgets/input_text_widget/input_text_widget.dart';

class CobrarPage extends StatefulWidget {
  const CobrarPage({Key? key}) : super(key: key);

  @override
  _CobrarPageState createState() => _CobrarPageState();
}

class _CobrarPageState extends State<CobrarPage> {
  final moneyInputTextController = MoneyMaskedTextController(
    leftSymbol: "R\$ ",
    decimalSeparator: ",",
  );
  bool showFab = true;

  @override
  Widget build(BuildContext context) {
    double? args = ModalRoute.of(context)!.settings.arguments as double?;
    print(args);
    if (args != null && showFab == true) {
      moneyInputTextController.text = args.toString();
      args = null;
      showFab = false;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Qual valor você quer receber?",
                  style: TextStyles.textBigBold,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 32,
                    bottom: 20,
                  ),
                  child: InputTextWidget(
                    autoFocus: true,
                    onChanged: (String value) {
                      setState(() {});
                    },
                    textInputType: TextInputType.number,
                    controller: moneyInputTextController,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      "/receber",
                      arguments: 0.0,
                    );
                  },
                  child: Text(
                    "Não especificar um valor >",
                    style: TextStyles.textNuSmall,
                  ),
                ),
              ],
            ),
            Visibility(
              visible: !showFab,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 20,
                ),
                child: TextButton(
                  onPressed: () {
                    print(moneyInputTextController.numberValue);
                    Navigator.pop(
                      context,
                      moneyInputTextController.numberValue,
                    );
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Atualizar valor",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.background,
                    padding: EdgeInsets.all(16),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(32),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: showFab == true
          ? FloatingActionButtonWidget(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  "/receber",
                  arguments: moneyInputTextController.numberValue,
                );
              },
              value: moneyInputTextController.numberValue,
            )
          : Container(),
    );
  }
}
