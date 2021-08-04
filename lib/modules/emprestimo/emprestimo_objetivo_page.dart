import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/button_nu/button_nu_widget.dart';
import 'package:nubank/shared/widgets/circle_icon_button/circle_icon_button_widget.dart';

class EmprestimoObjetivoPage extends StatefulWidget {
  const EmprestimoObjetivoPage({Key? key}) : super(key: key);

  @override
  _EmprestimoObjetivoPageState createState() => _EmprestimoObjetivoPageState();
}

class _EmprestimoObjetivoPageState extends State<EmprestimoObjetivoPage> {
  final titles = [
    'Contas da casa',
    'Reformas ou consertos',
    'Investir no meu negócio',
    'Viagem',
    'Dívida',
    'Despesas médicas',
    'Educação',
    'Compras',
    'Outros',
  ];
  int active = -1;
  final icons = [
    Icons.sticky_note_2_outlined,
    Icons.build_outlined,
    Icons.store_outlined,
    Icons.flight_takeoff_outlined,
    Icons.sticky_note_2_outlined,
    Icons.local_hospital_outlined,
    Icons.edit_outlined,
    Icons.shopping_bag_outlined,
    Icons.drag_indicator_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 20,
              ),
              child: Text(
                "Qual o objetivo do seu empréstimo?",
                style: TextStyles.textBigBold,
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleIconButtonWidget(
                    icon: icons[index],
                    color: index == active ? Colors.white : Colors.black,
                    onPressed: () {
                      active = index;
                      setState(() {});
                    },
                    background:
                        index == active ? AppColors.primary : Colors.grey[200],
                    padding: 12,
                  ),
                  title: Text(
                    titles[index],
                    style: TextStyles.textBold,
                  ),
                  onTap: () {
                    active = index;
                    setState(() {});
                  },
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 1,
                );
              },
              itemCount: titles.length,
            ),
            Divider(
              height: 1,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 95,
        child: Column(
          children: [
            Divider(
              height: 1,
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ButtonNuWidget(
                text: "Continuar",
                color: active == -1 ? Colors.grey[200] : AppColors.primary,
                textColor: active == -1 ? Colors.black26 : Colors.white,
                onPressed: () {
                  if (active != -1) {
                    Navigator.pushNamed(
                      context,
                      "/emprestimo_simular",
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
