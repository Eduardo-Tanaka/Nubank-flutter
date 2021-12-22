import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class IndicarAmigosFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.grey),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 4,
              right: 24,
              bottom: 32,
              left: 24,
            ),
            child: Text.rich(
              TextSpan(
                style: TextStyles.textTitle,
                children: [
                  TextSpan(
                    text: "Por",
                  ),
                  TextSpan(
                    text: " onde",
                    style: TextStyles.textTitleBold,
                  ),
                  TextSpan(
                    text: " você quer",
                  ),
                  TextSpan(
                    text: " indicar",
                    style: TextStyles.textTitleBold,
                  ),
                  TextSpan(
                    text: " seu amigo?",
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[100],
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: ListTile.divideTiles(
                  context: context,
                  tiles: [
                    Container(),
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      leading: Icon(Icons.mail_outline_outlined),
                      title: Text("E-MAIL"),
                      trailing: Badge(
                        badgeContent: Text(
                          '10',
                          style: TextStyles.titleBottomMenu,
                        ),
                        badgeColor: AppColors.primary,
                      ),
                    ),
                    // NÃO TENHO MESSENGER
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      leading: Icon(MdiIcons.facebookMessenger),
                      title: Text("FACEBOOK MESSENGER"),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      leading: Icon(MdiIcons.whatsapp),
                      title: Text("WHATSAPP"),
                      onTap: () async {
                        final String whatsappUrl =
                            "whatsapp://send?phone=&text=Você recebeu uma indicação para conhecer o Nubank....";

                        await canLaunch(whatsappUrl)
                            ? await launch(whatsappUrl)
                            : throw 'Could not launch $whatsappUrl';
                      },
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      leading: Icon(Icons.more_horiz),
                      title: Text("MAIS OPÇÕES"),
                      onTap: () {
                        Share.share(
                          "Você recebeu uma indicação para conhecer o Nubank....",
                        );
                      },
                    ),
                    Container(),
                  ],
                ).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
