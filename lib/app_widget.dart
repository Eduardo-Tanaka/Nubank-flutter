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
    return MaterialApp(
      title: 'Nubank',
      theme: ThemeData(
        backgroundColor: AppColors.background,
      ),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/home": (context) => HomePage(),
        "/ajuda": (context) => AjudaPage(),
        "/bloquear_cartao": (context) => BloquearCartaoPage(),
        "/cartao_virtual": (context) => CartaoVirtualPage(),
        "/cobrar": (context) => CobrarPage(),
        "/configuracao": (context) => ConfiguracaoPage(),
        "/depositar": (context) => DepositarPage(),
        "/doacao": (context) => DoacaoPage(),
        "/emprestimo": (context) => EmprestimoPage(),
        "/indicar_amigos": (context) => IndicarAmigosPage(),
        "/limite": (context) => LimitePage(),
        "/pagar": (context) => PagarPage(),
        "/pix": (context) => PixPage(),
        "/recarga": (context) => RecargaPage(),
        "/transferir": (context) => TransferirPage()
      },
    );
  }
}
