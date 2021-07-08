import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/input_text_widget/input_text_widget.dart';

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
      backgroundColor: Colors.white,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.arrow_forward,
          color: phoneInputTextController.text.length != 15
              ? Colors.grey[400]
              : Colors.white,
          size: 24,
        ),
        backgroundColor: phoneInputTextController.text.length != 15
            ? Colors.grey[200]
            : AppColors.background,
      ),
    );
  }
}
