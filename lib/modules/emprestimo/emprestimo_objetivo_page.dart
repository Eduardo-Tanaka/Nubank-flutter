import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nubank/modules/emprestimo/emprestimo_cubit.dart';
import 'package:nubank/shared/models/emprestimo.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/button_nu/button_nu_widget.dart';
import 'package:nubank/shared/widgets/circle_icon_button/circle_icon_button_widget.dart';

class EmprestimoObjetivoPage extends StatelessWidget {
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
    final bloc = BlocProvider.of<EmprestimoCubit>(context);
    bloc.init();
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
                return BlocBuilder<EmprestimoCubit, Emprestimo>(
                  bloc: bloc,
                  builder: (ctx, state) {
                    return ListTile(
                      leading: CircleIconButtonWidget(
                        icon: icons[index],
                        color: titles[index] == state.objetivo
                            ? Colors.white
                            : Colors.black,
                        onPressed: () {
                          ctx.read<EmprestimoCubit>().objetivo(titles[index]);
                        },
                        background: titles[index] == state.objetivo
                            ? AppColors.primary
                            : Colors.grey[200],
                        padding: 12,
                      ),
                      title: Text(
                        titles[index],
                        style: TextStyles.textBold,
                      ),
                      onTap: () {
                        ctx.read<EmprestimoCubit>().objetivo(titles[index]);
                      },
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 20,
                      ),
                    );
                  },
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
              child: BlocBuilder<EmprestimoCubit, Emprestimo>(
                builder: (context, state) {
                  return ButtonNuWidget(
                    text: "Continuar",
                    color: state.objetivo == null
                        ? Colors.grey[200]
                        : AppColors.primary,
                    textColor:
                        state.objetivo == null ? Colors.black26 : Colors.white,
                    onPressed: () {
                      if (state.objetivo != null) {
                        final DateTime now = DateTime.now();
                        final DateFormat formatter =
                            DateFormat("dd 'de' MMMM", 'pt_BR');
                        formatter.format(now.add(Duration(days: 30)));
                        Navigator.pushNamed(
                          context,
                          "/emprestimo_simular",
                        );
                      }
                    },
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
