import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';

class PixCopiaColaPage extends StatelessWidget {
  const PixCopiaColaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.grey),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Text(
                "Insira o código do QR code a pagar",
                style: TextStyles.textBigBold,
              ),
            ),
            TextFormField(
              cursorColor: AppColors.background,
              style: TextStyles.textCardGray,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintText: "Cole o código aqui",
                hintStyle: TextStyles.textCardGray,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey[300]!,
                    width: 2.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.arrow_forward,
          color: Colors.grey[400],
          size: 24,
        ),
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}
