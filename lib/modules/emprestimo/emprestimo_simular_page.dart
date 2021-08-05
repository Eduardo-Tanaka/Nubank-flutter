import 'package:flutter/material.dart';
import 'package:nubank/shared/models/emprestimo.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/button_nu/button_nu_widget.dart';
import 'package:nubank/shared/widgets/floating_action_button/floating_action_button_widget.dart';
import 'package:nubank/shared/widgets/radio_button/radio_button_widget.dart';

class EmprestimoSimularPage extends StatefulWidget {
  const EmprestimoSimularPage({Key? key}) : super(key: key);

  @override
  _EmprestimoSimularPageState createState() => _EmprestimoSimularPageState();
}

class _EmprestimoSimularPageState extends State<EmprestimoSimularPage> {
  String groupValue = 'pessoal';
  Emprestimo? emprestimo;
  bool edit = false;

  @override
  void didChangeDependencies() {
    emprestimo = ModalRoute.of(context)!.settings.arguments as Emprestimo;
    if (emprestimo?.tipo != null) {
      groupValue = emprestimo!.tipo!;
      edit = true;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        icon: Icons.chevron_left,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Escolha para simular",
              style: TextStyles.textBigBold,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Divider(
            height: 1,
          ),
          RadioButtonWidget(
            onChanged: (value) {
              setState(() {
                groupValue = 'pessoal';
              });
            },
            onTap: () {
              setState(() {
                groupValue = 'pessoal';
              });
            },
            value: 'pessoal',
            groupValue: groupValue,
            title: 'Empréstimo pessoal',
            subtitle: "Contratação mais rápida",
          ),
          RadioButtonWidget(
            onChanged: (value) {
              setState(() {
                groupValue = 'portabilidade';
              });
            },
            onTap: () {
              setState(() {
                groupValue = 'portabilidade';
              });
            },
            groupValue: groupValue,
            value: 'portabilidade',
            title: 'Empréstimo com portabilidade de salário',
            subtitle:
                "15% de desconto na taxa de juros.\n\nO pedido de portabilidade de salário é feito durante a contratação do empréstimo e o dinheiro cai na hora.",
            isNew: true,
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 95,
        child: Column(
          children: [
            Divider(
              height: 1,
              thickness: 1,
            ),
            edit
                ? Padding(
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Taxa de ${groupValue == 'portabilidade' ? '2,76%' : '3,25%'} ao mês",
                              style: TextStyles.textBold,
                            ),
                            Visibility(
                              visible: groupValue == 'portabilidade',
                              child: Text(
                                "Desconto de xxxx",
                                style: TextStyles.textMoneyGreen,
                              ),
                            ),
                          ],
                        ),
                        FloatingActionButtonWidget(
                          onPressed: () {
                            Navigator.pop(
                              context,
                              groupValue,
                            );
                          },
                          value: 1,
                          enableValue: 1,
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(20),
                    child: ButtonNuWidget(
                      text: "Simular empréstimo",
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          "/emprestimo_simular_info",
                          arguments: emprestimo!.copyWith(tipo: groupValue),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
