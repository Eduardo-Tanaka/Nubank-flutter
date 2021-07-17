import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nubank/modules/models/Ajuda.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/tile_ajuda/tile_ajuda_widget.dart';

class AjudaPixHomePage extends StatelessWidget {
  const AjudaPixHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        icon: Icons.navigate_before,
        title: "Pix",
        showTrailingIcon: true,
        trailingIcon: Icons.search,
        onPressedTrailing: () {},
      ),
      body: FutureBuilder<String>(
        future:
            DefaultAssetBundle.of(context).loadString("assets/ajuda/pix.json"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var list = json.decode(snapshot.data.toString());
            return ListView.separated(
              physics: BouncingScrollPhysics(),
              itemCount: list.length + 1,
              itemBuilder: (context, index) {
                if (index == list.length) {
                  return Divider(
                    height: 0.4,
                  );
                } else {
                  Ajuda ajuda = Ajuda.fromMap(list[index]);
                  return Column(
                    children: [
                      TileAjudaWidget(
                        title: ajuda.title,
                        description: ajuda.description,
                        expandSubtitle: false,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            "/ajuda_pix_detalhe",
                            arguments: ajuda,
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
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
