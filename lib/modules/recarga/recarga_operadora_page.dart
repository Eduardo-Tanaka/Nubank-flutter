import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/radio_button/radio_button_widget.dart';

class RecargaOperadoraPage extends StatefulWidget {
  const RecargaOperadoraPage({Key? key}) : super(key: key);

  @override
  _RecargaOperadoraPageState createState() => _RecargaOperadoraPageState();
}

class _RecargaOperadoraPageState extends State<RecargaOperadoraPage> {
  List<String> operadoras = [
    "Claro",
    "Nextel",
    "Oi",
    "TIM",
    "Vivo",
    "Correios"
  ];
  String? radioValue;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        value: 0.4,
        icon: Icons.navigate_before,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Qual é a operadora?",
                style: TextStyles.textBigBold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                left: 20,
                right: 20,
                bottom: 8,
              ),
              child: Text(
                args,
                style: TextStyles.text,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: operadoras.length,
              itemBuilder: (cc, i) {
                return RadioButtonWidget(
                  value: operadoras[i],
                  groupValue: radioValue,
                  onTap: () {
                    setState(() {
                      radioValue = operadoras[i];
                      print(radioValue);
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      radioValue = operadoras[i];
                      print(value);
                      print(radioValue);
                    });
                  },
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (radioValue != null) {
            /*Navigator.pushNamed(
              context,
              "/recarga_operadora",
            );*/
          }
        },
        child: Icon(
          Icons.arrow_forward,
          color: radioValue == null ? Colors.grey[400] : Colors.white,
          size: 24,
        ),
        backgroundColor:
            radioValue == null ? Colors.grey[200] : AppColors.background,
      ),
    );
  }
}
