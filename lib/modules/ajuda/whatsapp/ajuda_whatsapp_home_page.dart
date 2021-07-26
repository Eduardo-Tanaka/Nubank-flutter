import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nubank/shared/models/ajuda.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/tile_ajuda/tile_ajuda_widget.dart';

class AjudaWhatsappHomePage extends StatelessWidget {
  const AjudaWhatsappHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        icon: Icons.navigate_before,
        title: "Pagamentos no WhatsApp",
        showTrailingIcon: true,
        trailingIcon: Icons.search,
        onPressedTrailing: () {},
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString("assets/ajuda/whatsapp.json"),
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
                            "/ajuda_whatsapp_detalhe",
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