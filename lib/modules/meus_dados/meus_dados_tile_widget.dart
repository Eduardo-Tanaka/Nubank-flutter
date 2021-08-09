import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nubank/modules/meus_dados/meus_dados_cubit.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';

class MeusDadostileWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String trailing;

  const MeusDadostileWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MeusDadosCubit(),
      child: BlocBuilder<MeusDadosCubit, double>(
        builder: (ctx, state) {
          return GestureDetector(
            onTap: () {},
            onTapDown: (TapDownDetails details) {
              ctx.read<MeusDadosCubit>().fadeOut();
            },
            onTapCancel: () {
              ctx.read<MeusDadosCubit>().fadeIn();
            },
            child: Opacity(
              opacity: state,
              child: Container(
                color: Colors.transparent,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                          ),
                          Visibility(
                            visible: subtitle.isNotEmpty,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                subtitle,
                                style: TextStyles.textGreySmallBold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            trailing,
                            style: TextStyles.textGreySmallBold,
                          ),
                          Icon(
                            Icons.chevron_right_outlined,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
