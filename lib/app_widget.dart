import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nubank/modules/ajuda/ajuda_page.dart';
import 'package:nubank/modules/bloquear/bloquear_cartao_page.dart';
import 'package:nubank/modules/cartao_virtual/cartao_virtual_page.dart';
import 'package:nubank/modules/cobrar/cobrar_page.dart';
import 'package:nubank/modules/configuracao/configuracao_page.dart';
import 'package:nubank/modules/depositar/depositar_page.dart';
import 'package:nubank/modules/doacao/doacao_page.dart';
import 'package:nubank/modules/emprestimo/emprestimo_page.dart';
import 'package:nubank/modules/home/home_page.dart';
import 'package:nubank/modules/indicar_amigos/indicar_amigos_page.dart';
import 'package:nubank/modules/limite/limite_page.dart';
import 'package:nubank/modules/pagar/pagar_page.dart';
import 'package:nubank/modules/pix/pix_page.dart';
import 'package:nubank/modules/recarga/recarga_page.dart';
import 'package:nubank/modules/transferir/transferir_page.dart';
import 'package:nubank/shared/themes/app_colors.dart';

import 'modules/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  // travar orientacao da tela para retrato
  AppWidget() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final routes = {
      "/splash": SplashPage(),
      "/home": HomePage(),
      "/ajuda": AjudaPage(),
      "/bloquear_cartao": BloquearCartaoPage(),
      "/cartao_virtual": CartaoVirtualPage(),
      "/cobrar": CobrarPage(),
      "/configuracao": ConfiguracaoPage(),
      "/depositar": DepositarPage(),
      "/doacao": DoacaoPage(),
      "/emprestimo": EmprestimoPage(),
      "/indicar_amigos": IndicarAmigosPage(),
      "/limite": LimitePage(),
      "/pagar": PagarPage(),
      "/pix": PixPage(),
      "/recarga": RecargaPage(),
      "/transferir": TransferirPage()
    };
    return MaterialApp(
      title: 'Nubank',
      theme: ThemeData(
        backgroundColor: AppColors.background,
      ),
      initialRoute: "/splash",
      onGenerateRoute: (settings) {
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              routes[settings.name]!,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = Offset(0.0, 1.0);
            var end = Offset.zero;
            var tween = Tween(begin: begin, end: end);
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
      },
    );
  }
}
