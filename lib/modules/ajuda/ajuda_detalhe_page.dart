import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nubank/shared/models/ajuda.dart';
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
    double? bodyHeight;

    final args = ModalRoute.of(context)!.settings.arguments as Ajuda;
    if (bodyHeight == null) {
      bodyHeight = MediaQuery.of(context).size.height - 80;
    }

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
      body: BlocBuilder<AjudaCubit, bool>(
        builder: (context, state) {
          return Container(
            height: state
                ? MediaQuery.of(context).size.height - 80 - 136
                : MediaQuery.of(context).size.height,
            child: FutureBuilder(
              future: loadAjuda(),
              builder: (ctx, snapshot) {
                if (snapshot.connectionState == ConnectionState.done || state) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: state ? 4 : 20),
                    child: TileAjudaWidget(
                      title: args.title,
                      description: args.description,
                      expandSubtitle: true,
                      onTap: () {
                        ctx.read<AjudaCubit>().showBottom();
                      },
                    ),
                  );
                } else {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: TileAjudaShimmerWidget(
                      expandSubtitle: true,
                    ),
                  );
                }
              },
            ),
          );
        },
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
                              ButtonAjudaWidget(title: "SIM", onPressed: () {}),
                              ButtonAjudaWidget(title: "NÃO", onPressed: () {}),
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
  }

  Future loadAjuda() {
    return Future.delayed(Duration(seconds: 1));
  }
}
