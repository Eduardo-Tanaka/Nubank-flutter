import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/radio_button/radio_button_widget.dart';

class RecargaValorPage extends StatefulWidget {
  const RecargaValorPage({Key? key}) : super(key: key);

  @override
  _RecargaValorPageState createState() => _RecargaValorPageState();
}

class _RecargaValorPageState extends State<RecargaValorPage> {
  String? groupValue;
  List<int> valores = [20, 25, 30, 40, 50, 75, 120, 150, 180, 225];

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        value: 0.8,
        icon: Icons.navigate_before,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 8,
              ),
              child: Text(
                "Qual é o valor da recarga?",
                style: TextStyles.textBigBold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 16,
              ),
              child: Text(
                args,
                style: TextStyles.textGrey,
              ),
            ),
            ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: valores.length,
              itemBuilder: (context, position) {
                return RadioButtonWidget(
                  onChanged: (value) {
                    setState(() {
                      groupValue = value;
                    });
                  },
                  onTap: () {
                    setState(() {
                      groupValue = "R\$ ${valores[position]},00";
                    });
                  },
                  groupValue: groupValue,
                  value: "R\$ ${valores[position]},00",
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (groupValue != null) {
            Navigator.pushNamed(context, "/recarga_resumo",
                arguments: groupValue);
          }
        },
        child: Icon(
          Icons.arrow_forward,
          color: groupValue == null ? Colors.grey[400] : Colors.white,
          size: 24,
        ),
        backgroundColor:
            groupValue == null ? Colors.grey[200] : AppColors.background,
      ),
    );
  }
}
