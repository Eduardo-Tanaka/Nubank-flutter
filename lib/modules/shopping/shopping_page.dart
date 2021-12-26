import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nubank/shared/models/shopping.dart';
import 'package:nubank/shared/themes/app_colors.dart';
import 'package:nubank/shared/themes/app_text_styles.dart';
import 'package:nubank/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:nubank/shared/widgets/card_shopping/card_shopping_widget.dart';
import 'package:nubank/shared/widgets/text/text_new_widget.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoppings = [
      Shopping(
        image: "https://picsum.photos/200",
        title: "Booking.com",
        subTitle: "6% de cashback",
        url: '',
      ),
      Shopping(
        image: "https://picsum.photos/200",
        title: "Xbox",
        subTitle: "11% OFF",
        url: '',
      ),
      Shopping(
        image: "https://picsum.photos/200",
        title: "PlayStation",
        subTitle: "11% OFF",
        url: '',
      ),
      Shopping(
        image: "https://picsum.photos/200",
        title: "Hype Games",
        subTitle: "Até 30% OFF",
        url: '',
      ),
      Shopping(
        image: "https://picsum.photos/200",
        title: "Nike",
        subTitle: "Até 10% OFF",
        url: '',
      ),
      Shopping(
        image: "https://picsum.photos/200",
        title: "Centauro",
        subTitle: "Até 12% OFF",
        url: '',
      ),
      Shopping(
        image: "https://picsum.photos/200",
        title: "Netshoes",
        subTitle: "17% OFF",
        url: '',
      ),
      Shopping(
        image: "https://picsum.photos/200",
        title: "Zattini",
        subTitle: "17% OFF",
        url: '',
      ),
      Shopping(
        image: "https://picsum.photos/200",
        title: "Dafiti",
        subTitle: "10% OFF",
        url: '',
      ),
      Shopping(
        image: "https://picsum.photos/200",
        title: "Casas Bahia",
        subTitle: "A partir de 5% OFF",
        url: '',
      ),
      Shopping(
        image: "https://picsum.photos/200",
        title: "Magazine Luiza",
        subTitle: "Até 10% OFF",
        url: '',
      ),
      Shopping(
        image: "https://picsum.photos/200",
        title: "Shopee",
        subTitle: "R\$10 OFF",
        url: '',
      ),
      Shopping(
        image: "https://picsum.photos/200",
        title: "Ponto",
        subTitle: "A partir de 5% OFF",
        url: '',
      ),
      Shopping(
        image: "https://picsum.photos/200",
        title: "Extra",
        subTitle: "A partir de 5% OFF",
        url: '',
      ),
      Shopping(
        image: "https://picsum.photos/200",
        title: "Samsung",
        subTitle: "Preços Especiais",
        url: '',
      ),
      Shopping(
        image: "https://picsum.photos/200",
        title: "Xiaomi",
        subTitle: "Preços Especiais",
        url: '',
      ),
      Shopping(
        image: "https://picsum.photos/200",
        title: "Motorola",
        subTitle: "Preços Especiais",
        url: '',
      ),
    ];

    return Scaffold(
      appBar: AppBarWidget(
        showTrailingIcon: true,
        onPressedTrailing: () {},
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextNewWidget(text: "Beta"),
            SizedBox(
              height: 8,
            ),
            Text(
              "Shopping",
              style: TextStyles.textNuBigBold,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 8),
              child: Text(
                "Vantagens exclusivas das nossas marcas preferidas",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Wrap(
              spacing: 16, // gap between adjacent chips
              runSpacing: 12, // gap between lines
              children: shoppings.map((shop) {
                return GestureDetector(
                  child: CardShoppingWidget(
                    image: shop.image,
                    title: shop.title,
                    subtitle: shop.subTitle,
                  ),
                  onTap: () => {
                    print(shop.url),
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
            ),
            builder: (context) {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      iconSize: 28,
                      splashRadius: 12,
                      padding: const EdgeInsets.only(top: 0, bottom: 0),
                      icon: Icon(
                        Icons.close,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      tooltip: "FECHAR",
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Termos e Condições",
                            style: TextStyles.titleBlackBold,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 12,
                              bottom: 40,
                            ),
                            child: Text(
                              "As ofertas apresentadas nesta página são oferecidas por nossos parceiros. Ao continuar, você reconhece que esses parceiros são responsáveis pelas suas ofertas e pelo atendimento referente a elas. Você pode entrar em contato com a gente a qualquer momento para entender mais sobre nossas parceiras.",
                              style: TextStyles.textSmall14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    text:
                        "Ao continuar, você declara ter lido e concordado com os ",
                  ),
                  TextSpan(
                    text: "Termos e Condições",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                    recognizer: new TapGestureRecognizer()..onTap = () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
