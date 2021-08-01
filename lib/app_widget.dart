import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nubank/modules/ajuda/ajuda_detalhe_page.dart';
import 'package:nubank/modules/ajuda/ajuda_home_page.dart';
import 'package:nubank/modules/ajuda/ajuda_page.dart';
import 'package:nubank/modules/ajuda/pix/ajuda_pix_detalhe_page.dart';
import 'package:nubank/modules/ajuda/pix/ajuda_pix_home_page.dart';
import 'package:nubank/modules/ajuda/whatsapp/ajuda_whatsapp_detalhe_page.dart';
import 'package:nubank/modules/ajuda/whatsapp/ajuda_whatsapp_home_page.dart';
import 'package:nubank/modules/bloquear/bloquear_cartao_page.dart';
import 'package:nubank/modules/boleto/boleto_page.dart';
import 'package:nubank/modules/cartao_virtual/cartao_virtual_page.dart';
import 'package:nubank/modules/cobrar/cobrar_page.dart';
import 'package:nubank/modules/configuracao/configuracao_page.dart';
import 'package:nubank/modules/depositar/depositar_page.dart';
import 'package:nubank/modules/doacao/doacao_page.dart';
import 'package:nubank/modules/emprestimo/emprestimo_page.dart';
import 'package:nubank/modules/home/home_page.dart';
import 'package:nubank/modules/indicar_amigos/indicar_amigos_page.dart';
import 'package:nubank/modules/limite/limite_page.dart';
import 'package:nubank/modules/meus_dados/meus_dados_page.dart';
import 'package:nubank/modules/pagar/pagar_page.dart';
import 'package:nubank/modules/perfil/perfil_page.dart';
import 'package:nubank/modules/pix/pix_chaves/registrar/pix_registrar_chave_input_page.dart';
import 'package:nubank/modules/pix/pix_chaves/registrar/pix_registrar_chave_page.dart';
import 'package:nubank/modules/pix/pix_page.dart';
import 'package:nubank/modules/recarga/recarga_forma_pagamento_page.dart';
import 'package:nubank/modules/recarga/recarga_operadora_page.dart';
import 'package:nubank/modules/recarga/recarga_page.dart';
import 'package:nubank/modules/recarga/recarga_resumo_page.dart';
import 'package:nubank/modules/recarga/recarga_valor_page.dart';
import 'package:nubank/modules/receber/receber_page.dart';
import 'package:nubank/modules/seguro/detalhes/seguro_vida_detalhe_funeral_familiar_page.dart';
import 'package:nubank/modules/seguro/detalhes/seguro_vida_detalhe_hospitalizacao_page.dart';
import 'package:nubank/modules/seguro/detalhes/seguro_vida_detalhe_invalidez_page.dart';
import 'package:nubank/modules/seguro/detalhes/seguro_vida_morte_detalhe_natural_acidental_page.dart';
import 'package:nubank/modules/seguro/seguro_vida_funcionamento_page.dart';
import 'package:nubank/modules/seguro/seguro_vida_info_page.dart';
import 'package:nubank/modules/seguro/seguro_vida_page.dart';
import 'package:nubank/modules/seguro/seguro_vida_simular_page.dart';
import 'package:nubank/modules/seguro/seguro_vida_simular_page2.dart';
import 'package:nubank/modules/transferir/qrcode/qrcode_read_page.dart';
import 'package:nubank/modules/transferir/transferir_destino_page.dart';
import 'package:nubank/modules/transferir/transferir_page.dart';
import 'package:nubank/shared/themes/app_colors.dart';

import 'modules/investimentos/investimentos_page.dart';
import 'modules/pagar/pagar_boleto_page.dart';
import 'modules/pagar/pagar_modo_pagamento_page.dart';
import 'modules/pagar/pagar_valor_page.dart';
import 'modules/pix/pix_chaves/pix_chaves_page.dart';
import 'modules/pix/pix_copia_cola/pix_copia_cola_page.dart';
import 'modules/seguro/detalhes/seguro_vida_detalhe_funeral_titular_page.dart';
import 'modules/seguro/seguro_vida_simular_page3.dart';
import 'modules/seguro/seguro_vida_simular_page4.dart';
import 'modules/seguro/seguro_vida_termos_page.dart';
import 'modules/splash/splash_page.dart';
import 'modules/transferir/qrcode/transferir_qrcode_page.dart';
import 'modules/transferir/transferir_confirmar_page.dart';
import 'modules/whatsapp/whatsapp_cadastrar_page.dart';

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
      "/ajuda_detalhe": AjudaDetalhePage(),
      "/ajuda_home": AjudaHomePage(),
      "/ajuda_pix_home": AjudaPixHomePage(),
      "/ajuda_pix_detalhe": AjudaPixDetalhePage(),
      "/ajuda_whatsapp_home": AjudaWhatsappHomePage(),
      "/ajuda_whatsapp_detalhe": AjudaWhatsappDetalhePage(),
      "/bloquear_cartao": BloquearCartaoPage(),
      "/boleto": BoletoPage(),
      "/cartao_virtual": CartaoVirtualPage(),
      "/cobrar": CobrarPage(),
      "/depositar": DepositarPage(),
      "/doacao": DoacaoPage(),
      "/emprestimo": EmprestimoPage(),
      "/indicar_amigos": IndicarAmigosPage(),
      "/investimentos": InvestimentosPage(),
      "/limite": LimitePage(),
      "/meus_dados": MeusDadosPage(),
      "/pagar": PagarPage(),
      "/pagar_boleto": PagarBoletoPage(),
      "/pagar_modo_pagamento": PagarModoPagamentoPage(),
      "/pagar_valor": PagarValorPage(),
      "/perfil": PerfilPage(),
      "/pix": PixPage(),
      "/pix_chaves": PixChavesPage(),
      "/pix_registrar_chave": PixRegistrarChavePage(),
      "/pix_registrar_chave_input": PixRegistrarChaveInputPage(),
      "/recarga": RecargaPage(),
      "/recarga_operadora": RecargaOperadoraPage(),
      "/recarga_forma_pagamento": RecargaFormaPagamentoPage(),
      "/recarga_valor": RecargaValorPage(),
      "/recarga_resumo": RecargaResumoPage(),
      "/receber": ReceberPage(),
      "/seguro_vida": SeguroVidaPage(),
      "/seguro_vida_detalhe_morte_natural_acidental":
          SeguroVidaDetalheMorteNaturalAcidentalPage(),
      "/seguro_vida_detalhe_funeral_titular":
          SeguroVidaDetalheFuneralTitularPage(),
      "/seguro_vida_detalhe_hospitalizacao":
          SeguroVidaDetalheHospitalizacaoPage(),
      "/seguro_vida_detalhe_invalidez": SeguroVidaDetalheInvalidezPage(),
      "/seguro_vida_detalhe_funeral_familiar":
          SeguroVidaDetalheFuneralFamiliarPage(),
      "/seguro_vida_funcionamento": SeguroVidaFuncionamentoPage(),
      "/seguro_vida_info": SeguroVidaInfoPage(),
      "/seguro_vida_simular": SeguroVidaSimularPage(),
      "/seguro_vida_simular2": SeguroVidaSimularPage2(),
      "/seguro_vida_simular3": SeguroVidaSimularPage3(),
      "/seguro_vida_simular4": SeguroVidaSimularPage4(),
      "/seguro_vida_termos": SeguroVidaTermosPage(),
      "/transferir": TransferirPage(),
      "/transferir_confirmar": TransferirConfirmarPage(),
      "/transferir_destino": TransferirDestinoPage(),
      "/transferir_qrcode": TransferirQrcodePage(),
      "/pix_copia_cola": PixCopiaColaPage(),
      "/qrcode_read": QrcodeReadPage(),
      "/whatsapp_cadastrar": WhatsappCadastrarPage(),
    };
    return MaterialApp(
      title: 'Nubank',
      theme: ThemeData(
        backgroundColor: AppColors.primary,
        scaffoldBackgroundColor: Colors.white,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.background,
          selectionColor: AppColors.background,
          selectionHandleColor: AppColors.background,
        ),
      ),
      initialRoute: "/splash",
      routes: {
        "/configuracao": (context) => ConfiguracaoPage(),
      },
      onGenerateRoute: (settings) {
        return PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 400),
            settings: settings,
            pageBuilder: (context, animation, secondaryAnimation) =>
                routes[settings.name] ?? HomePage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              switch (settings.name) {
                case "/ajuda_detalhe":
                case "/ajuda_pix_detalhe":
                case "/ajuda_whatsapp_detalhe":
                case "/boleto":
                case "/investimentos":
                case "/meus_dados":
                case "/pagar_boleto":
                case "/pagar_modo_pagamento":
                case "/pix_copia_cola":
                case "/pix_chaves":
                case "/pix_registrar_chave":
                case "/pix_registrar_chave_input":
                case "/recarga_operadora":
                case "/recarga_forma_pagamento":
                case "/recarga_valor":
                case "/recarga_resumo":
                case "/receber":
                case "/seguro_vida":
                case "/seguro_vida_funcionamento":
                case "/seguro_vida_simular2":
                case "/seguro_vida_simular3":
                case "/seguro_vida_simular4":
                case "/seguro_vida_termos":
                case "/transferir_destino":
                case "/qrcode_read":
                  return slideRightLeft(animation, child);
                default:
                  return slideBottomTop(animation, child);
              }
            });
      },
    );
  }

  slideBottomTop(animation, child) {
    var begin = Offset(0.0, 1.0);
    var end = Offset.zero;
    var tween = Tween(begin: begin, end: end);
    var offsetAnimation = animation.drive(tween);
    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  }

  slideRightLeft(animation, child) {
    var begin = Offset(1.0, 0.0);
    var end = Offset.zero;
    var tween = Tween(begin: begin, end: end);
    var offsetAnimation = animation.drive(tween);
    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  }
}
