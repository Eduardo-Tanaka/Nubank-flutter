import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/button_nu/button_nu_widget.dart';
import 'package:nubank/shared/widgets/circle_icon_button/circle_icon_button_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class InvestimentosInfoPage extends StatelessWidget {
  const InvestimentosInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        icon: Icons.chevron_left_outlined,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Crie sua conta no app da Easynvest e comece a investir",
                  style: TextStyles.textBigBold,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: ListTile(
                  leading: CircleIconButtonWidget(
                    icon: Icons.local_atm_outlined,
                    color: Colors.black,
                    onPressed: null,
                    background: Colors.grey[200],
                    padding: 8,
                  ),
                  title: Text(
                    "Taxa zero",
                  ),
                  subtitle: Text(
                    "Taxa zero em corretagem de ações e maioria dos produtos de Renda Fixa.",
                  ),
                  onTap: null,
                ),
              ),
              Divider(
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: ListTile(
                  leading: CircleIconButtonWidget(
                    icon: Icons.phone_android_outlined,
                    color: Colors.black,
                    onPressed: null,
                    background: Colors.grey[200],
                    padding: 8,
                  ),
                  title: Text(
                    "100% digital",
                  ),
                  subtitle: Text(
                    "Você escolhe os produtos que quer investir direo no app da Easynvest.",
                  ),
                  onTap: null,
                ),
              ),
              Divider(
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: ListTile(
                  leading: CircleIconButtonWidget(
                    icon: Icons.favorite_outline,
                    color: Colors.black,
                    onPressed: null,
                    padding: 8,
                    background: Colors.grey[200],
                  ),
                  title: Text(
                    "O investimento certo para você",
                  ),
                  subtitle: Text(
                    "Simule e compare os rendimentos de mais de 400 produtos antes de investir.",
                  ),
                  onTap: null,
                ),
              ),
              Divider(
                height: 1,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ButtonNuWidget(
              text: "Ir para a Easynvest",
              onPressed: () async {
                List<Application> apps =
                    await DeviceApps.getInstalledApplications(
                        onlyAppsWithLaunchIntent: true,
                        includeSystemApps: true);
                print(apps);
                bool isInstalled = await DeviceApps.isAppInstalled(
                  'br.com.easynvest.rendafixa',
                );
                if (isInstalled) {
                  await DeviceApps.openApp('br.com.easynvest.rendafixa');
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    "/home",
                    (route) => false,
                  );
                } else {
                  final String _url =
                      'https://play.google.com/store/apps/details?id=br.com.easynvest.rendafixa';
                  await canLaunch(_url)
                      ? await launch(_url)
                      : throw 'Could not launch $_url';
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
