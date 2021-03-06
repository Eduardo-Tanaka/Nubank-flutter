import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nubank/shared/cubit/bool_cubit.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';

import '../../custom_font_app_icons.dart';

class ConfigurarAppPage extends StatelessWidget {
  const ConfigurarAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BoolCubit(false),
      child: Scaffold(
        appBar: AppBarWidget(
          icon: CustomFontApp.back,
          title: "CONFIGURAÇÕES DO APP",
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Divider(
                height: 1,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Flexible(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Compartilhar localização",
                            style: TextStyles.text,
                          ),
                          Text(
                            "Para melhorar a sua segurança contra fraudes e a oferta de produtos de crédito, Nubank gostaria de acessar a sua localização mesmo que o aplicativo não esteja em uso",
                            style: TextStyles.textCardGrey,
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<BoolCubit, bool>(
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
                  ],
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
