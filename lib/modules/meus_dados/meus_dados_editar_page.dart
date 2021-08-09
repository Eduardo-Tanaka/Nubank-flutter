import 'package:flutter/material.dart';
import 'package:nubank/modules/meus_dados/meus_dados.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/button_nu/button_nu_rectangle_widget.dart';

class MeusDadosEditarPage extends StatelessWidget {
  const MeusDadosEditarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meusDados = ModalRoute.of(context)!.settings.arguments as MeusDados;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 60,
          left: 20,
          right: 20,
          bottom: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getText(meusDados.type),
            Text(
              meusDados.editValue,
              style: TextStyles.titleBlack,
            ),
            ButtonNuRectangleWidget(
              text: "ALTERAR",
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget getText(String type) {
    if (type == "email") {
      return Text.rich(
        TextSpan(
          text: "Editar ",
          style: TextStyles.textTitle,
          children: [
            TextSpan(
              text: "e-mail",
              style: TextStyles.textTitleBold,
            ),
            TextSpan(
              text: " cadastrado",
              style: TextStyles.textTitle,
            ),
          ],
        ),
      );
    } else if (type == "nome") {
      return Text.rich(
        TextSpan(
          text: "Editar ",
          style: TextStyles.textTitle,
          children: [
            TextSpan(
              text: "nome de preferência",
              style: TextStyles.textNuTitleBold,
            ),
          ],
        ),
      );
    } else {
      return Text.rich(
        TextSpan(
          text: "Editar ",
          style: TextStyles.textTitle,
          children: [
            TextSpan(
              text: "telefone",
              style: TextStyles.textTitleBold,
            ),
            TextSpan(
              text: " cadastrado",
              style: TextStyles.textTitle,
            ),
          ],
        ),
      );
    }
  }
}
