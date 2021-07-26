import 'package:flutter/material.dart';
import 'package:nubank/shared/models/ajuda.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/button_ajuda/button_ajuda_widget.dart';
import 'package:nubank/shared/widgets/tile_ajuda/tile_ajuda_widget.dart';
import 'package:share_plus/share_plus.dart';

class AjudaWhatsappDetalhePage extends StatefulWidget {
  const AjudaWhatsappDetalhePage({Key? key}) : super(key: key);

  @override
  _AjudaWhatsappDetalhePageState createState() =>
      _AjudaWhatsappDetalhePageState();
}

class _AjudaWhatsappDetalhePageState extends State<AjudaWhatsappDetalhePage> {
  bool showFeedback = false;
  double? bodyHeight;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Ajuda;
    if (bodyHeight == null) {
      bodyHeight = MediaQuery.of(context).size.height - 80;
    }

    return Scaffold(
      appBar: AppBarWidget(
        icon: Icons.navigate_before,
        title: "Pagamentos no WhatsApp",
        showTrailingIcon: true,
        trailingIcon: Icons.share_outlined,
        onPressedTrailing: () async {
          await Share.share(args.title);
          Future.delayed(Duration(seconds: 1)).then(
            (value) => setState(() {
              showFeedback = true;
              // appbar + appstatus + bottomNavigationBar
              bodyHeight = MediaQuery.of(context).size.height - 80 - 140;
            }),
          );
        },
      ),
      body: Container(
        height: bodyHeight,
        child: TileAjudaWidget(
          title: args.title,
          description: args.description,
          expandSubtitle: true,
          onTap: () {
            setState(() {
              showFeedback = true;
              bodyHeight = MediaQuery.of(context).size.height - 80 - 140;
            });
          },
        ),
      ),
      bottomNavigationBar: AnimatedSwitcher(
        duration: Duration(seconds: 1),
        child: showFeedback
            ? Material(
                elevation: 10,
                color: Colors.white,
                child: Container(
                  height: 140,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
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
      ),
    );
  }
}
