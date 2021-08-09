import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nubank/shared/cubit/bool_cubit.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';

class ConfigurarSegurancaPage extends StatelessWidget {
  const ConfigurarSegurancaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BoolCubit(false),
      child: Scaffold(
        appBar: AppBarWidget(
          icon: Icons.chevron_left_outlined,
          title: "Segurança",
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 4,
              ),
              child: ListTile(
                title: Text(
                  "Acesso ao app",
                  style: TextStyles.textBlack,
                ),
                subtitle: Text(
                  "Solicitar biometria ou senha para acessar o app",
                  style: TextStyles.textCardGrey,
                ),
                trailing: BlocBuilder<BoolCubit, bool>(
                  builder: (ctx, state) {
                    return Switch(
                      onChanged: (bool value) {
                        ctx.read<BoolCubit>().change(value);
                      },
                      value: state,
                      activeColor: AppColors.primary,
                    );
                  },
                ),
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
