import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:nubank/shared/enums/ChaveTipoEnum.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/floating_action_button/floating_action_button_widget.dart';
import 'package:nubank/shared/widgets/input_text_widget/input_text_widget.dart';
import 'RegistrarChaveModel.dart';

class PixRegistrarChaveInputPage extends StatefulWidget {
  const PixRegistrarChaveInputPage({Key? key}) : super(key: key);

  @override
  _PixRegistrarChaveInputPageState createState() =>
      _PixRegistrarChaveInputPageState();
}

class _PixRegistrarChaveInputPageState
    extends State<PixRegistrarChaveInputPage> {
  dynamic textController;
  bool firstBuild = true;
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as RegistrarChaveModel;
    if (firstBuild) {
      if (args.type == ChaveTipoEnum.TELEFONE) {
        textController = MaskedTextController(mask: "(00) 000000000");
      } else {
        textController = TextEditingController();
      }
      textController.text = args.value!;
      firstBuild = false;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        icon: Icons.navigate_before,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Registrar ${args.type.value?.toLowerCase()}",
                  style: TextStyles.textBigBold,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 32),
                  child: Text(
                    "Insira o ${args.type.value?.toLowerCase()} que você quer usar para receber transferências por Pix.",
                  ),
                ),
                InputTextWidget(
                  autoFocus: false,
                  onChanged: (String value) {
                    setState(() {});
                  },
                  textInputType: args.type == ChaveTipoEnum.TELEFONE
                      ? TextInputType.number
                      : TextInputType.emailAddress,
                  controller: textController,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButtonWidget(
        onPressed: () {
          if (args.type == ChaveTipoEnum.TELEFONE) {
            if (textController.text.length == 14) {
              print(textController.text);
            }
          } else {
            if (textController.text.isNotEmpty) {
              print(textController.text);
            }
          }
        },
        value: args.type == ChaveTipoEnum.TELEFONE
            ? textController.text.length
            : textController.text,
        enableValue: args.type == ChaveTipoEnum.TELEFONE ? 14 : 0,
      ),
    );
  }
}
