import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_images.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';

class BloquearCartaoPage extends StatelessWidget {
  const BloquearCartaoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return Container(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Image.asset(
                  AppImages.ic_lock_on,
                  width: 24,
                  height: 24,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text.rich(
                  TextSpan(
                    text: "Você quer ",
                    children: [
                      TextSpan(
                        text: "bloquear temporariamente ",
                        style: TextStyles.textBlack,
                      ),
                      TextSpan(text: "o seu cartão?")
                    ],
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.5, // the height between text, default is 1.0
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("CANCELAR"),
                      style: OutlinedButton.styleFrom(
                        primary: Colors.black,
                        padding: const EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text("BLOQUEAR"),
                      style: OutlinedButton.styleFrom(
                        primary: AppColors.background,
                        padding: const EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
