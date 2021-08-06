import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nubank/shared/models/ajuda.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/button_ajuda/button_ajuda_widget.dart';
import 'package:nubank/shared/widgets/tile_ajuda/tile_ajuda_shimmer_widget.dart';
import 'package:nubank/shared/widgets/tile_ajuda/tile_ajuda_widget.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

import 'ajuda_cubit.dart';

class AjudaDetalhePage extends StatelessWidget {
  const AjudaDetalhePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AjudaCubit>(
      create: (context) => AjudaCubit(),
      child: AjudaDetalhe(),
    );
  }
}

class AjudaDetalhe extends StatelessWidget {
  const AjudaDetalhe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Ajuda;

    return FutureBuilder(
      future: loadAjuda(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBarWidget(
              icon: Icons.navigate_before,
              title: args.superTitle,
              showTrailingIcon: true,
              trailingIcon: Icons.share_outlined,
              onPressedTrailing: () async {
                await Share.share(args.title);
                Future.delayed(Duration(seconds: 1)).then(
                  (_) => context.read<AjudaCubit>().showBottom(),
                );
              },
            ),
            body: Container(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: TileAjudaWidget(
                  title: args.title,
                  description: args.description,
                  expandSubtitle: true,
                  onTap: () {
                    context.read<AjudaCubit>().showBottom();
                  },
                ),
              ),
            ),
            bottomNavigationBar: BlocBuilder<AjudaCubit, bool>(
              builder: (context, state) {
                return AnimatedSwitcher(
                  duration: Duration(seconds: 1),
                  child: state
                      ? Material(
                          child: Container(
                            color: Colors.white,
                            height: 120,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Divider(
                                  height: 1,
                                  thickness: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Text("Este artigo foi útil?"),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ButtonAjudaWidget(
                                        title: "SIM", onPressed: () {}),
                                    ButtonAjudaWidget(
                                        title: "NÃO", onPressed: () {}),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      : Container(
                          height: 0,
                        ),
                );
              },
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              title: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: 100,
                  color: Colors.white,
                  child: Text(
                    "",
                    style: TextStyles.textBlack,
                  ),
                ),
              ),
            ),
            body: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: TileAjudaShimmerWidget(
                expandSubtitle: true,
              ),
            ),
          );
        }
      },
    );
  }

  Future loadAjuda() {
    return Future.delayed(Duration(seconds: 1));
  }
}
