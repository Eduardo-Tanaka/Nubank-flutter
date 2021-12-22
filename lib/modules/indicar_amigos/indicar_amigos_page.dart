import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_images.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';

class IndicarAmigosPage extends StatelessWidget {
  const IndicarAmigosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.grey),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Resgate seus amigos da fila do banco",
              style: TextStyles.textTitle,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 16,
              ),
              child: Text(
                "Para cada indicação aceita, um amigo salvo da burocracia",
                style: TextStyles.textSmall,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  "/indicar_amigos_form",
                );
              },
              child: Text(
                "INDICAR AMIGOS",
                style: TextStyles.textNuSmallBold,
              ),
              style: TextButton.styleFrom(
                primary: Colors.black45,
                side: BorderSide(color: Colors.purple, width: 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Image.asset(
                AppImages.indicar,
                height: 300,
              ),
            )
          ],
        ),
      ),
    );
  }
}
