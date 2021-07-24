import 'package:flutter/material.dart';
import 'package:nubank/modules/meus_dados/meus_dados_tile_widget.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';

final titles = [
  "Nome de \preferência",
  "E-mail",
  "Telefone",
  "Endereço",
  "Renda mensal",
  "Alterar senha de acesso",
  "Consultar senha de 4 dígitos",
  "Autorizar aparelho",
  "Acesso pelo site",
  "Extrato anual de juros, tarifas e impostos",
];

final trailings = [
  "Eduardo",
  "teste@teste.com",
  "(xx) xxxxx-xxxxx",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
];

final subtitles = [
  "",
  "",
  "",
  "",
  "",
  "Utilizada para acessar app e site",
  "Usada para compras e transações",
  "",
  "",
  "",
];

class MeusDadosPage extends StatelessWidget {
  const MeusDadosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        icon: Icons.keyboard_backspace_outlined,
        title: "Perfil",
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Divider(
              height: 1,
              thickness: 1,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, position) {
                return MeusDadostileWidget(
                  title: titles[position],
                  subtitle: subtitles[position],
                  trailing: trailings[position],
                );
              },
              separatorBuilder: (context, position) {
                return Divider(
                  height: 1,
                  thickness: 1,
                );
              },
              itemCount: titles.length,
            ),
          ],
        ),
      ),
    );
  }
}
