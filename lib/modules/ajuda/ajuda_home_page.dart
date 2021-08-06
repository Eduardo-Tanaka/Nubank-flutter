import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nubank/shared/models/ajuda.dart';
import 'package:nubank/shared/models/ajuda_params.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/tile_ajuda/tile_ajuda_shimmer_widget.dart';
import 'package:nubank/shared/widgets/tile_ajuda/tile_ajuda_widget.dart';
import 'package:shimmer/shimmer.dart';

class AjudaHomePage extends StatelessWidget {
  const AjudaHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as AjudaParams;

    return FutureBuilder(
      future: loadAsset(context, args.jsonFile),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var list = json.decode(snapshot.data.toString());
          return Scaffold(
            appBar: AppBarWidget(
              icon: Icons.navigate_before,
              title: args.title,
              showTrailingIcon: true,
              trailingIcon: Icons.search,
              onPressedTrailing: () {},
            ),
            body: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemCount: list.length + 1,
              itemBuilder: (context, index) {
                if (index == list.length) {
                  return Divider(
                    height: 0.4,
                  );
                } else {
                  var ajuda = Ajuda.fromMap(list[index]);
                  return Column(
                    children: [
                      TileAjudaWidget(
                        title: ajuda.title,
                        description: ajuda.description,
                        expandSubtitle: false,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            "/ajuda_detalhe",
                            arguments: ajuda.copyWith(superTitle: args.title),
                          );
                        },
                      ),
                    ],
                  );
                }
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 1,
                  thickness: 1,
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
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: (context, index) {
                  if (index == 10) {
                    return Divider(
                      height: 0.4,
                    );
                  } else {
                    return Column(
                      children: [
                        TileAjudaShimmerWidget(),
                      ],
                    );
                  }
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 1,
                    thickness: 1,
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }

  Future<String> loadAsset(BuildContext context, String jsonFile) {
    return Future.delayed(Duration(seconds: 1)).then(
      (value) => DefaultAssetBundle.of(context).loadString(
        "assets/ajuda/$jsonFile",
      ),
    );
  }
}
