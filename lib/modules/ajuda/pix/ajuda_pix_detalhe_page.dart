import 'package:flutter/material.dart';
import 'package:nubank/modules/models/Ajuda.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/tile_ajuda/tile_ajuda_widget.dart';

class AjudaPixDetalhePage extends StatefulWidget {
  const AjudaPixDetalhePage({Key? key}) : super(key: key);

  @override
  _AjudaPixDetalhePageState createState() => _AjudaPixDetalhePageState();
}

class _AjudaPixDetalhePageState extends State<AjudaPixDetalhePage> {
  bool showFeedback = false;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Ajuda;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        icon: Icons.navigate_before,
        title: "Pix",
        showTrailingIcon: true,
        trailingIcon: Icons.share_outlined,
        onPressedTrailing: () {},
      ),
      body: TileAjudaWidget(
        title: args.title,
        description: args.description,
        expandSubtitle: true,
        onTap: () {
          setState(() {
            showFeedback = true;
          });
        },
      ),
      bottomNavigationBar: Visibility(
        visible: showFeedback,
        child: Material(
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "SIM",
                          style: TextStyles.textBlack,
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          padding: EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 60,
                          ),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(32),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "NÃO",
                          style: TextStyles.textBlack,
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          padding: EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 60,
                          ),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(32),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
