import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/floating_action_button/floating_action_button_widget.dart';
import 'package:nubank/shared/widgets/input_text/input_text_widget.dart';

class RecargaPage extends StatefulWidget {
  const RecargaPage({Key? key}) : super(key: key);

  @override
  _RecargaPageState createState() => _RecargaPageState();
}

class _RecargaPageState extends State<RecargaPage> {
  final phoneInputTextController = MaskedTextController(
    mask: "(00) 00000-0000",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        value: 0.2,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          children: [
            Text(
              "Qual número você quer recarregar?",
              style: TextStyles.textBigBold,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: InputTextWidget(
                autoFocus: true,
                onChanged: (String value) {
                  setState(() {});
                },
                textInputType: TextInputType.number,
                controller: phoneInputTextController,
                hint: "(DDD) + Número",
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButtonWidget(
        onPressed: () {
          if (phoneInputTextController.text.length == 15) {
            Navigator.pushNamed(
              context,
              "/recarga_operadora",
              arguments: phoneInputTextController.text,
            );
          }
        },
        value: phoneInputTextController.text.length,
        enableValue: 15,
      ),
    );
  }
}
