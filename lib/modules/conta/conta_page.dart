import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nubank/custom_font_app_icons.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/circle_icon_button/circle_icon_button_widget.dart';
import 'package:nubank/shared/widgets/input_text/input_search_widget.dart';
import 'package:nubank/shared/widgets/tile/tile_widget.dart';
import 'dart:math' as math;

class ContaPage extends StatelessWidget {
  const ContaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titles = [
      "Depositar",
      "Pagar",
      "Transferir",
      "Empréstimos",
      "Cobrar",
    ];
    final icons = [
      CustomFontApp.cash_minus,
      CustomFontApp.barcode,
      CustomFontApp.cash_plus,
      CustomFontApp.personal_loan,
      CustomFontApp.cobrar,
    ];

    final routes = [
      "/depositar",
      "/pagar",
      "/transferir",
      "/emprestimo",
      "/cobrar",
    ];

    return Scaffold(
      appBar: AppBarWidget(
        icon: Icons.chevron_left_outlined,
        showTrailingIcon: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Saldo disponível",
                            style: TextStyles.textGreyBold,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              "R\$ 2000,00",
                              style: TextStyles.textBigBold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TileWidget(
                      iconLeading: Icons.savings_outlined,
                      title: "Dinheiro guardado",
                      subtitle: "R\$ 1000,00",
                      showDivider: false,
                      onTap: () {},
                    ),
                    TileWidget(
                      iconLeading: Icons.signal_cellular_alt_outlined,
                      title: "Rendimento total da conta",
                      subtitle: "+R\$ 5,50 este mês",
                      showDivider: false,
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 130,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, position) {
                          return Padding(
                            padding: position == 0
                                ? EdgeInsets.only(left: 20, right: 8)
                                : EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              children: [
                                CircleIconButtonWidget(
                                  icon: icons[position],
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      routes[position],
                                    );
                                  },
                                  background: Colors.grey[200],
                                  color: Colors.black,
                                  padding: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: Text(
                                    titles[position],
                                    textAlign: TextAlign.center,
                                    style: TextStyles.textBlack12Bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: titles.length,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Divider(
                      height: 1,
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          horizontalTitleGap: 4,
                          leading: Icon(
                            CustomFontApp.personal_loan,
                            color: Colors.black,
                          ),
                          title: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "R\$25.000,00",
                                  style: TextStyles.textBold,
                                ),
                                TextSpan(text: " disponível para empréstimo"),
                              ],
                            ),
                          ),
                          trailing: Icon(
                            Icons.chevron_right_outlined,
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              "/emprestimo",
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        "Histórico",
                        style: TextStyles.textTitleBold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              minHeight: 70,
              maxHeight: 70,
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: InputSearchWidget(
                    prefixIcon: Icons.search_outlined,
                    title: "Buscar",
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                DateFormat formatter = DateFormat("dd MMM");
                return InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleIconButtonWidget(
                              icon: Icons.help_outline_outlined,
                              onPressed: () {},
                              padding: 8,
                              color: Colors.black,
                              background: Colors.grey[200],
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Tipo",
                                      style: TextStyles.textBold,
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text("nome pessoa / empresa"),
                                    Text(
                                      "R\$ ${(Random().nextDouble() * 100 * (index + 1)).toStringAsFixed(2)}",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              formatter.format(
                                DateTime.now().subtract(Duration(days: index)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(height: 1),
                    ],
                  ),
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
