import 'package:flutter/material.dart';
import 'package:nubank/modules/home/home_page.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((_) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
    return Container(
      color: AppColors.background,
      child: Center(
        child: Image.asset(
          AppImages.icon,
          width: 160,
          height: 160,
        ),
      ),
    );
  }
}
